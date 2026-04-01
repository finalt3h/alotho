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

  void updatePhoneNumber(String value) {
    state = state.copyWith(phoneNumber: value, errorMessage: null);
  }

  Future<bool> loginWithPhone() async {
    final normalizedPhone = state.phoneNumber.trim();

    if (normalizedPhone.length < AppConstants.minimumPhoneLength) {
      state = state.copyWith(errorMessage: 'So dien thoai chua hop le.');
      return false;
    }

    state = state.copyWith(isSubmitting: true, errorMessage: null);

    final result = await ref
        .read(authRepositoryProvider)
        .loginWithPhone(normalizedPhone);

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
