import 'package:alo_tho/core/constants/app_constants.dart';
import 'package:alo_tho/features/auth/data/repositories/supabase_auth_repository.dart';
import 'package:alo_tho/features/auth/domain/entities/auth_registration_result.dart';
import 'package:alo_tho/features/auth/domain/entities/user.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_controller.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/register_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerControllerProvider =
    NotifierProvider<RegisterController, RegisterState>(RegisterController.new);

class RegisterController extends Notifier<RegisterState> {
  @override
  RegisterState build() => const RegisterState();

  void updateFullName(String value) {
    state = state.copyWith(fullName: value, errorMessage: null);
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value, errorMessage: null);
  }

  void updatePhoneNumber(String value) {
    state = state.copyWith(phoneNumber: value, errorMessage: null);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value, errorMessage: null);
  }

  void updateConfirmPassword(String value) {
    state = state.copyWith(confirmPassword: value, errorMessage: null);
  }

  void updateAccountType({required bool isWorker}) {
    state = state.copyWith(isWorker: isWorker, errorMessage: null);
  }

  Future<AuthRegistrationResult?> registerWithCredentials() async {
    final fullName = state.fullName.trim();
    final email = state.email.trim();
    final phoneNumber = state.phoneNumber.trim();
    final password = state.password.trim();
    final confirmPassword = state.confirmPassword.trim();
    final isWorker = state.isWorker;

    if (fullName.isEmpty) {
      state = state.copyWith(errorMessage: 'Ho ten chua hop le.');
      return null;
    }

    if (!_isValidEmail(email)) {
      state = state.copyWith(errorMessage: 'Email chua hop le.');
      return null;
    }

    if (phoneNumber.isNotEmpty && !_isValidPhoneNumber(phoneNumber)) {
      state = state.copyWith(errorMessage: 'So dien thoai chua hop le.');
      return null;
    }

    if (password.length < AppConstants.minimumPasswordLength) {
      state = state.copyWith(errorMessage: 'Mat khau chua hop le.');
      return null;
    }

    if (confirmPassword != password) {
      state = state.copyWith(errorMessage: 'Mat khau xac nhan khong khop.');
      return null;
    }

    state = state.copyWith(isSubmitting: true, errorMessage: null);

    final result = await ref
        .read(authRepositoryProvider)
        .registerWithCredentials(
          fullName: fullName,
          email: email,
          phoneNumber: phoneNumber.isEmpty ? null : phoneNumber,
          password: password,
          isWorker: isWorker,
        );

    state = state.copyWith(isSubmitting: false);

    return result.when(
      success: (registrationResult) {
        final user = registrationResult.user;
        if (registrationResult.hasActiveSession && user != null) {
          ref.read(authSessionControllerProvider.notifier).signIn(user);
        }
        return registrationResult;
      },
      failure: (failure) {
        state = state.copyWith(errorMessage: failure.message);
        return null;
      },
    );
  }

  Future<User?> loginWithGoogle() async {
    state = state.copyWith(isSubmitting: true, errorMessage: null);

    final result = await ref.read(authRepositoryProvider).loginWithGoogle();

    state = state.copyWith(isSubmitting: false);

    return result.when(
      success: (user) {
        ref.read(authSessionControllerProvider.notifier).signIn(user);
        return user;
      },
      failure: (failure) {
        state = state.copyWith(errorMessage: failure.message);
        return null;
      },
    );
  }

  bool _isValidEmail(String value) {
    if (value.isEmpty) {
      return false;
    }

    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    return emailRegex.hasMatch(value);
  }

  bool _isValidPhoneNumber(String value) {
    final digitsOnly = value.replaceAll(RegExp(r'\D'), '');
    return digitsOnly.length >= AppConstants.minimumPhoneLength;
  }
}
