import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_verification_state.freezed.dart';

@freezed
class OtpVerificationState with _$OtpVerificationState {
  const factory OtpVerificationState({
    @Default('') String otp,
    @Default(false) bool isSubmitting,
    @Default(false) bool isResending,
    String? errorMessage,
    String? infoMessage,
  }) = _OtpVerificationState;
}
