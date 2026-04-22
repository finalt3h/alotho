import 'dart:async';

import 'package:alo_tho/core/constants/app_constants.dart';
import 'package:alo_tho/core/effects/ui_effect.dart';
import 'package:alo_tho/features/auth/data/repositories/supabase_auth_repository.dart';
import 'package:alo_tho/features/auth/domain/entities/auth_registration_result.dart';
import 'package:alo_tho/features/auth/domain/entities/user.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_controller.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/register_ui_action.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/register_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerControllerProvider =
    NotifierProvider<RegisterController, RegisterState>(RegisterController.new);

final registerUiActionProvider = StreamProvider<UiEffect>((ref) {
  return ref.watch(registerControllerProvider.notifier).actions;
});

class RegisterController extends Notifier<RegisterState> {
  final StreamController<UiEffect> _actionsController =
      StreamController<UiEffect>.broadcast();

  Stream<UiEffect> get actions => _actionsController.stream;

  @override
  RegisterState build() {
    ref.onDispose(_actionsController.close);
    return const RegisterState();
  }

  void _emitAction(UiEffect action) {
    if (!_actionsController.isClosed) {
      _actionsController.add(action);
    }
  }

  void _emitError(String message) {
    _emitAction(ShowErrorMessage(message));
  }

  void updateFullName(String value) {
    state = state.copyWith(fullName: value);
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  void updatePhoneNumber(String value) {
    state = state.copyWith(phoneNumber: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }

  void updateConfirmPassword(String value) {
    state = state.copyWith(confirmPassword: value);
  }

  void updateAccountType({required bool isWorker}) {
    state = state.copyWith(isWorker: isWorker);
  }

  Future<AuthRegistrationResult?> registerWithCredentials() async {
    final fullName = state.fullName.trim();
    final email = state.email.trim();
    final phoneNumber = state.phoneNumber.trim();
    final password = state.password.trim();
    final confirmPassword = state.confirmPassword.trim();
    final isWorker = state.isWorker;

    if (fullName.isEmpty) {
      _emitError('Ho ten chua hop le.');
      return null;
    }

    if (!_isValidEmail(email)) {
      _emitError('Email chua hop le.');
      return null;
    }

    if (phoneNumber.isNotEmpty && !_isValidPhoneNumber(phoneNumber)) {
      _emitError('So dien thoai chua hop le.');
      return null;
    }

    if (password.length < AppConstants.minimumPasswordLength) {
      _emitError('Mat khau chua hop le.');
      return null;
    }

    if (confirmPassword != password) {
      _emitError('Mat khau xac nhan khong khop.');
      return null;
    }

    state = state.copyWith(isSubmitting: true);

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
        _emitAction(
          RegisterRegistrationSucceededAction(
            hasActiveSession: registrationResult.hasActiveSession,
            identifier: email,
          ),
        );
        return registrationResult;
      },
      failure: (failure) {
        _emitError(failure.message);
        return null;
      },
    );
  }

  Future<User?> loginWithGoogle() async {
    state = state.copyWith(isSubmitting: true);

    final result = await ref.read(authRepositoryProvider).loginWithGoogle();

    state = state.copyWith(isSubmitting: false);

    return result.when(
      success: (user) {
        ref.read(authSessionControllerProvider.notifier).signIn(user);
        return user;
      },
      failure: (failure) {
        _emitError(failure.message);
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
