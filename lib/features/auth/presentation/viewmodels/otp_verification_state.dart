class OtpVerificationState {
  const OtpVerificationState({
    this.otp = '',
    this.isSubmitting = false,
    this.isResending = false,
  });

  final String otp;
  final bool isSubmitting;
  final bool isResending;

  OtpVerificationState copyWith({
    String? otp,
    bool? isSubmitting,
    bool? isResending,
  }) {
    return OtpVerificationState(
      otp: otp ?? this.otp,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isResending: isResending ?? this.isResending,
    );
  }
}
