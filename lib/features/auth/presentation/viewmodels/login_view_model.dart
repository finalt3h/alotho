import 'dart:async';

import 'package:alo_tho/core/constants/app_constants.dart';
import 'package:alo_tho/core/effects/ui_effect.dart';
import 'package:alo_tho/features/auth/data/datasources/login_identifier_local_data_source.dart';
import 'package:alo_tho/features/auth/data/repositories/supabase_auth_repository.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_controller.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/login_ui_action.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginControllerProvider = NotifierProvider<LoginController, LoginState>(
  LoginController.new,
);

final loginUiActionProvider = StreamProvider<UiEffect>((ref) {
  return ref.watch(loginControllerProvider.notifier).actions;
});

/// Handles sign-in form state and delegates the actual auth work to the repository.
class LoginController extends Notifier<LoginState> {
  final StreamController<UiEffect> _actionsController =
      StreamController<UiEffect>.broadcast();

  Stream<UiEffect> get actions => _actionsController.stream;

  @override
  LoginState build() {
    ref.onDispose(_actionsController.close);
    unawaited(_restoreLastLoginIdentifier());
    return const LoginState();
  }

  void _emitAction(UiEffect action) {
    if (!_actionsController.isClosed) {
      _actionsController.add(action);
    }
  }

  void _emitError(String message) {
    _emitAction(ShowErrorMessage(message));
  }

  void updateIdentifier(String value) {
    state = state.copyWith(identifier: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }

  Future<bool> loginWithCredentials() async {
    final normalizedIdentifier = state.identifier.trim();
    final password = state.password.trim();

    if (!_isValidIdentifier(normalizedIdentifier)) {
      _emitError('So dien thoai hoac email chua hop le.');
      return false;
    }

    if (password.length < AppConstants.minimumPasswordLength) {
      _emitError('Mat khau chua hop le.');
      return false;
    }

    state = state.copyWith(isSubmitting: true);

    final result = await ref
        .read(authRepositoryProvider)
        .loginWithCredentials(
          identifier: normalizedIdentifier,
          password: password,
        );

    state = state.copyWith(isSubmitting: false);

    return result.when(
      success: (user) async {
        await ref
            .read(loginIdentifierLocalDataSourceProvider)
            .saveLastLoginIdentifier(normalizedIdentifier);
        ref.read(authSessionControllerProvider.notifier).signIn(user);
        return true;
      },
      failure: (failure) async {
        if (_requiresActivation(failure.message)) {
          _emitAction(
            LoginRequiresActivationAction(
              identifier: normalizedIdentifier,
              message: failure.message,
            ),
          );
        } else {
          _emitError(failure.message);
        }
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

  bool _requiresActivation(String message) {
    return message ==
        'Tai khoan chua kich hoat. Vui long nhap OTP de kich hoat.';
  }

  Future<bool> loginWithGoogle() async {
    state = state.copyWith(isSubmitting: true);

    final result = await ref.read(authRepositoryProvider).loginWithGoogle();

    state = state.copyWith(isSubmitting: false);

    return result.when(
      success: (user) {
        ref.read(authSessionControllerProvider.notifier).signIn(user);
        return true;
      },
      failure: (failure) {
        _emitError(failure.message);
        return false;
      },
    );
  }

  Future<void> _restoreLastLoginIdentifier() async {
    final identifier = await ref
        .read(loginIdentifierLocalDataSourceProvider)
        .getLastLoginIdentifier();
    if (identifier.isEmpty || state.identifier.isNotEmpty) {
      return;
    }

    state = state.copyWith(identifier: identifier);
  }
}
