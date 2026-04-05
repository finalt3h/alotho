import 'dart:async';

import 'package:alo_tho/core/constants/app_constants.dart';
import 'package:alo_tho/features/auth/data/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

final supabaseClientProvider = Provider<supabase.SupabaseClient>(
  (ref) => supabase.Supabase.instance.client,
);

final authRemoteDataSourceProvider = Provider<SupabaseAuthRemoteDataSource>(
  (ref) => SupabaseAuthRemoteDataSource(ref.watch(supabaseClientProvider)),
);

class AuthRegistrationRemoteResult {
  const AuthRegistrationRemoteResult({
    required this.hasActiveSession,
    this.user,
  });

  final bool hasActiveSession;
  final UserModel? user;
}

class SupabaseAuthRemoteDataSource {
  static const _googleLoginTimeout = Duration(minutes: 2);

  SupabaseAuthRemoteDataSource(this._client);

  final supabase.SupabaseClient _client;

  Future<AuthRegistrationRemoteResult> registerWithCredentials({
    required String fullName,
    required String email,
    String? phoneNumber,
    required String password,
  }) async {
    final trimmedEmail = email.trim();
    final trimmedPhoneNumber = phoneNumber?.trim();
    final response = await _client.auth.signUp(
      email: trimmedEmail,
      password: password,
      data: {
        'full_name': fullName.trim(),
        if (trimmedPhoneNumber != null && trimmedPhoneNumber.isNotEmpty)
          'phone_number': trimmedPhoneNumber,
      },
    );

    final authUser = response.user;
    if (authUser == null && response.session == null) {
      throw const supabase.AuthException('Tao tai khoan khong thanh cong.');
    }

    return AuthRegistrationRemoteResult(
      hasActiveSession: response.session != null,
      user: authUser == null ? null : UserModel.fromSupabaseUser(authUser),
    );
  }

  Future<UserModel> verifyActivationOtp({
    required String identifier,
    required String token,
  }) async {
    final trimmedIdentifier = identifier.trim();
    final isEmail = _isEmail(trimmedIdentifier);
    final response = await _client.auth.verifyOTP(
      email: isEmail ? trimmedIdentifier : null,
      phone: isEmail ? null : _normalizePhoneNumber(trimmedIdentifier),
      token: token.trim(),
      type: isEmail ? supabase.OtpType.signup : supabase.OtpType.sms,
    );

    final authUser = response.user ?? _client.auth.currentUser;
    if (authUser == null) {
      throw const supabase.AuthException('Xac thuc OTP khong thanh cong.');
    }

    return UserModel.fromSupabaseUser(authUser);
  }

  Future<void> resendActivationOtp({required String identifier}) async {
    final trimmedIdentifier = identifier.trim();
    final isEmail = _isEmail(trimmedIdentifier);

    await _client.auth.resend(
      email: isEmail ? trimmedIdentifier : null,
      phone: isEmail ? null : _normalizePhoneNumber(trimmedIdentifier),
      type: isEmail ? supabase.OtpType.signup : supabase.OtpType.sms,
    );
  }

  Future<UserModel> loginWithCredentials({
    required String identifier,
    required String password,
  }) async {
    final trimmedIdentifier = identifier.trim();
    final response = await _client.auth.signInWithPassword(
      email: _isEmail(trimmedIdentifier) ? trimmedIdentifier : null,
      phone: _isEmail(trimmedIdentifier)
          ? null
          : _normalizePhoneNumber(trimmedIdentifier),
      password: password,
    );

    final authUser = response.user;
    if (authUser == null) {
      throw const supabase.AuthException('Dang nhap khong thanh cong.');
    }

    return UserModel.fromSupabaseUser(authUser);
  }

  Stream<UserModel?> authStateChanges() {
    return _client.auth.onAuthStateChange.map(
      (event) => event.session?.user == null
          ? null
          : UserModel.fromSupabaseUser(event.session!.user),
    );
  }

  Future<UserModel?> getCurrentUser() async {
    final authUser = _client.auth.currentUser;
    if (authUser == null) {
      return null;
    }

    return UserModel.fromSupabaseUser(authUser);
  }

  Future<void> signOut() => _client.auth.signOut();

  Future<UserModel> loginWithGoogle() async {
    final currentUser = _client.auth.currentUser;
    if (currentUser != null) {
      return UserModel.fromSupabaseUser(currentUser);
    }

    final signInCompleter = Completer<UserModel>();
    late final StreamSubscription<supabase.AuthState> authSubscription;
    Timer? timeoutTimer;

    void completeWithUser(supabase.User authUser) {
      if (signInCompleter.isCompleted) {
        return;
      }
      signInCompleter.complete(UserModel.fromSupabaseUser(authUser));
    }

    void completeWithError(Object error, [StackTrace? stackTrace]) {
      if (signInCompleter.isCompleted) {
        return;
      }
      signInCompleter.completeError(error, stackTrace);
    }

    authSubscription = _client.auth.onAuthStateChange.listen((authState) {
      final authUser = authState.session?.user;
      if (authUser != null) {
        completeWithUser(authUser);
      }
    }, onError: completeWithError);

    timeoutTimer = Timer(_googleLoginTimeout, () {
      completeWithError(
        const supabase.AuthException(
          'Dang nhap Google het thoi gian. Vui long thu lai.',
        ),
      );
    });

    try {
      final launched = await _client.auth.signInWithOAuth(
        supabase.OAuthProvider.google,
        redirectTo: AppConstants.googleAuthRedirectUrl,
      );

      if (!launched) {
        throw const supabase.AuthException(
          'Khong mo duoc man hinh dang nhap Google.',
        );
      }

      final refreshedUser = _client.auth.currentUser;
      if (refreshedUser != null) {
        return UserModel.fromSupabaseUser(refreshedUser);
      }

      return await signInCompleter.future;
    } finally {
      timeoutTimer.cancel();
      await authSubscription.cancel();
    }
  }

  bool _isEmail(String value) => value.contains('@');

  String _normalizePhoneNumber(String value) {
    final trimmedValue = value.trim();
    if (trimmedValue.startsWith('+')) {
      return '+${trimmedValue.substring(1).replaceAll(RegExp(r'\D'), '')}';
    }

    final digitsOnly = trimmedValue.replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.startsWith('0')) {
      return '+84${digitsOnly.substring(1)}';
    }

    if (digitsOnly.startsWith('84')) {
      return '+$digitsOnly';
    }

    return '+$digitsOnly';
  }
}
