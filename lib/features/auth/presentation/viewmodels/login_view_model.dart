import 'package:alo_tho/core/constants/app_constants.dart';
import 'package:alo_tho/features/auth/data/repositories/mock_auth_repository.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_controller.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginControllerProvider = NotifierProvider<LoginController, LoginState>(
  LoginController.new,
);

/// Handles sign-in form state and delegates the actual auth work to the repository.
class LoginController extends Notifier<LoginState> {
  @override
  LoginState build() => const LoginState();

  void updateIdentifier(String value) {
    state = state.copyWith(identifier: value, errorMessage: null);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value, errorMessage: null);
  }

  Future<bool> loginWithCredentials() async {
    final normalizedIdentifier = state.identifier.trim();
    final password = state.password.trim();

    if (!_isValidIdentifier(normalizedIdentifier)) {
      state = state.copyWith(
        errorMessage: 'So dien thoai hoac email chua hop le.',
      );
      return false;
    }

    if (password.length < AppConstants.minimumPasswordLength) {
      state = state.copyWith(errorMessage: 'Mat khau chua hop le.');
      return false;
    }

    state = state.copyWith(isSubmitting: true, errorMessage: null);

    final result = await ref
        .read(authRepositoryProvider)
        .loginWithCredentials(
          identifier: normalizedIdentifier,
          password: password,
        );

    state = state.copyWith(isSubmitting: false);

    return result.when(
      success: (user) {
        ref.read(authSessionControllerProvider.notifier).signIn(user);
        return true;
      },
      failure: (failure) {
        state = state.copyWith(errorMessage: failure.message);
        return false;
      },
    );
  }

  bool _isValidIdentifier(String value) {
    if (value.isEmpty) {
      return false;
    }

    if (value.contains('@')) {
      final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
      return emailRegex.hasMatch(value);
    }

    final digitsOnly = value.replaceAll(RegExp(r'\D'), '');
    return digitsOnly.length >= AppConstants.minimumPhoneLength;
  }

  Future<bool> loginWithGoogle() async {
    state = state.copyWith(isSubmitting: true, errorMessage: null);

    final result = await ref.read(authRepositoryProvider).loginWithGoogle();

    state = state.copyWith(isSubmitting: false);

    return result.when(
      success: (user) {
        ref.read(authSessionControllerProvider.notifier).signIn(user);
        return true;
      },
      failure: (failure) {
        state = state.copyWith(errorMessage: failure.message);
        return false;
      },
    );
  }
}
