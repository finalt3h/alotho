class RegisterState {
  const RegisterState({
    this.fullName = '',
    this.email = '',
    this.phoneNumber = '',
    this.password = '',
    this.confirmPassword = '',
    this.isWorker = false,
    this.isSubmitting = false,
  });

  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;
  final bool isWorker;
  final bool isSubmitting;

  RegisterState copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? password,
    String? confirmPassword,
    bool? isWorker,
    bool? isSubmitting,
  }) {
    return RegisterState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isWorker: isWorker ?? this.isWorker,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}
