import 'package:alo_tho/features/auth/data/repositories/supabase_auth_repository.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_controller.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/otp_verification_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final otpVerificationControllerProvider =
    NotifierProvider<OtpVerificationController, OtpVerificationState>(
      OtpVerificationController.new,
    );

class OtpVerificationController extends Notifier<OtpVerificationState> {
  @override
  OtpVerificationState build() => const OtpVerificationState();

  void updateOtp(String value) {
    state = state.copyWith(otp: value, errorMessage: null, infoMessage: null);
  }

  Future<bool> verifyActivationOtp({required String identifier}) async {
    final otp = state.otp.trim();
    if (otp.length < 6) {
      state = state.copyWith(errorMessage: 'Ma OTP chua hop le.');
      return false;
    }

    state = state.copyWith(
      isSubmitting: true,
      errorMessage: null,
      infoMessage: null,
    );

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
        state = state.copyWith(errorMessage: failure.message);
        return false;
      },
    );
  }

  Future<bool> resendActivationOtp({required String identifier}) async {
    if (state.isResending) {
      return false;
    }

    state = state.copyWith(
      isResending: true,
      errorMessage: null,
      infoMessage: null,
    );

    final result = await ref
        .read(authRepositoryProvider)
        .resendActivationOtp(identifier: identifier);

    state = state.copyWith(isResending: false);

    return result.when(
      success: (_) {
        state = state.copyWith(infoMessage: 'Da gui lai ma OTP.');
        return true;
      },
      failure: (failure) {
        state = state.copyWith(errorMessage: failure.message);
        return false;
      },
    );
  }
}
