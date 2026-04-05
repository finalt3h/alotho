import 'package:alo_tho/core/errors/failure.dart';
import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/auth/data/datasources/supabase_auth_remote_data_source.dart';
import 'package:alo_tho/features/auth/domain/entities/auth_registration_result.dart';
import 'package:alo_tho/features/auth/domain/entities/user.dart';
import 'package:alo_tho/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  return SupabaseAuthRepository(remoteDataSource);
});

class SupabaseAuthRepository implements AuthRepository {
  SupabaseAuthRepository(this._remoteDataSource);

  final SupabaseAuthRemoteDataSource _remoteDataSource;

  @override
  Future<Result<AuthRegistrationResult>> registerWithCredentials({
    required String fullName,
    required String email,
    String? phoneNumber,
    required String password,
  }) async {
    try {
      final result = await _remoteDataSource.registerWithCredentials(
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );
      return Success(
        AuthRegistrationResult(
          hasActiveSession: result.hasActiveSession,
          user: result.user?.toEntity(),
        ),
      );
    } on supabase.AuthException catch (error) {
      return Error(Failure(_mapSignUpError(error), code: error.statusCode));
    } catch (_) {
      return const Error(Failure('Khong the tao tai khoan luc nay.'));
    }
  }

  @override
  Future<Result<User>> verifyActivationOtp({
    required String identifier,
    required String token,
  }) async {
    try {
      final user = await _remoteDataSource.verifyActivationOtp(
        identifier: identifier,
        token: token,
      );
      return Success(user.toEntity());
    } on supabase.AuthException catch (error) {
      return Error(Failure(_mapOtpError(error), code: error.statusCode));
    } catch (_) {
      return const Error(Failure('Xac thuc OTP khong thanh cong.'));
    }
  }

  @override
  Future<Result<bool>> resendActivationOtp({required String identifier}) async {
    try {
      await _remoteDataSource.resendActivationOtp(identifier: identifier);
      return const Success(true);
    } on supabase.AuthException catch (error) {
      return Error(Failure(_mapResendOtpError(error), code: error.statusCode));
    } catch (_) {
      return const Error(Failure('Khong the gui lai ma OTP luc nay.'));
    }
  }

  @override
  Stream<User?> authStateChanges() {
    return _remoteDataSource.authStateChanges().map(
      (userModel) => userModel?.toEntity(),
    );
  }

  @override
  Future<User?> getCurrentUser() async {
    final userModel = await _remoteDataSource.getCurrentUser();
    return userModel?.toEntity();
  }

  @override
  Future<Result<User>> loginWithCredentials({
    required String identifier,
    required String password,
  }) async {
    try {
      final user = await _remoteDataSource.loginWithCredentials(
        identifier: identifier,
        password: password,
      );
      return Success(user.toEntity());
    } on supabase.AuthException catch (error) {
      return Error(Failure(_mapAuthError(error), code: error.statusCode));
    } catch (_) {
      return const Error(
        Failure('Khong the dang nhap bang so dien thoai hoac email.'),
      );
    }
  }

  @override
  Future<Result<User>> loginWithGoogle() async {
    try {
      final user = await _remoteDataSource.loginWithGoogle();
      return Success(user.toEntity());
    } on UnimplementedError catch (error) {
      return Error(Failure(error.message ?? 'Dang nhap Google chua kha dung.'));
    } on supabase.AuthException catch (error) {
      return Error(Failure(_mapAuthError(error), code: error.statusCode));
    } catch (_) {
      return const Error(Failure('Khong the dang nhap voi Google luc nay.'));
    }
  }

  @override
  Future<void> signOut() => _remoteDataSource.signOut();

  String _mapOtpError(supabase.AuthException error) {
    final message = error.message.trim();

    if (message.isEmpty) {
      return 'Xac thuc OTP khong thanh cong.';
    }

    if (message.contains('Token has expired')) {
      return 'Ma OTP da het han hoac khong hop le.';
    }

    if (message.contains('invalid') || message.contains('Invalid')) {
      return 'Ma OTP da het han hoac khong hop le.';
    }

    return message;
  }

  String _mapResendOtpError(supabase.AuthException error) {
    final message = error.message.trim();

    if (message.isEmpty) {
      return 'Khong the gui lai ma OTP luc nay.';
    }

    return message;
  }

  String _mapSignUpError(supabase.AuthException error) {
    final message = error.message.trim();

    if (message.isEmpty) {
      return 'Khong the tao tai khoan luc nay.';
    }

    if (message.contains('User already registered')) {
      return 'Tai khoan da ton tai.';
    }

    if (message.contains('Password should be at least')) {
      return 'Mat khau chua hop le.';
    }

    if (message.contains('Password is too weak')) {
      return 'Mat khau chua hop le.';
    }

    if (message.contains('For security purposes')) {
      return 'Tai khoan da ton tai.';
    }

    return message;
  }

  String _mapAuthError(supabase.AuthException error) {
    final message = error.message.trim();

    if (message.isEmpty) {
      return 'Dang nhap khong thanh cong. Vui long thu lai.';
    }

    if (message.contains('Invalid login credentials')) {
      return 'Thong tin dang nhap khong chinh xac.';
    }

    if (message.contains('Email not confirmed')) {
      return 'Tai khoan chua kich hoat. Vui long nhap OTP de kich hoat.';
    }

    if (message.contains('Phone not confirmed')) {
      return 'Tai khoan chua kich hoat. Vui long nhap OTP de kich hoat.';
    }

    return message;
  }
}
