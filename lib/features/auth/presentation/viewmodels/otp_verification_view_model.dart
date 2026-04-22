import 'dart:async';

import 'package:alo_tho/core/effects/ui_effect.dart';
import 'package:alo_tho/features/auth/data/repositories/supabase_auth_repository.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_controller.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/otp_verification_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final otpVerificationControllerProvider =
    NotifierProvider<OtpVerificationController, OtpVerificationState>(
      OtpVerificationController.new,
    );

final otpVerificationUiActionProvider = StreamProvider<UiEffect>((ref) {
  return ref.watch(otpVerificationControllerProvider.notifier).actions;
});

class OtpVerificationController extends Notifier<OtpVerificationState> {
  final StreamController<UiEffect> _actionsController =
      StreamController<UiEffect>.broadcast();

  Stream<UiEffect> get actions => _actionsController.stream;

  @override
  OtpVerificationState build() {
    ref.onDispose(_actionsController.close);
    return const OtpVerificationState();
  }

  void _emitError(String message) {
    if (_actionsController.isClosed) {
      return;
    }
    _actionsController.add(ShowErrorMessage(message));
  }

  void _emitSuccess(String message) {
    if (_actionsController.isClosed) {
      return;
    }
    _actionsController.add(ShowSuccessMessage(message));
  }

  void updateOtp(String value) {
    state = state.copyWith(otp: value);
  }

  Future<bool> verifyActivationOtp({required String identifier}) async {
    final otp = state.otp.trim();
    if (otp.length < 6) {
      _emitError('Ma OTP chua hop le.');
      return false;
    }

    state = state.copyWith(isSubmitting: true);

    final result = await ref
        .read(authRepositoryProvider)
        .verifyActivationOtp(identifier: identifier, token: otp);

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

  Future<bool> resendActivationOtp({required String identifier}) async {
    if (state.isResending) {
      return false;
    }

    state = state.copyWith(isResending: true);

    final result = await ref
        .read(authRepositoryProvider)
        .resendActivationOtp(identifier: identifier);

    state = state.copyWith(isResending: false);

    return result.when(
      success: (_) {
        _emitSuccess('Da gui lai ma OTP.');
        return true;
      },
      failure: (failure) {
        _emitError(failure.message);
        return false;
      },
    );
  }
}
