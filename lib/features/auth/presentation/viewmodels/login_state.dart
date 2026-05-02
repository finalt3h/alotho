class LoginState {
  const LoginState({
    this.identifier = '',
    this.password = '',
    this.isSubmitting = false,
  });

  final String identifier;
  final String password;
  final bool isSubmitting;

  LoginState copyWith({
    String? identifier,
    String? password,
    bool? isSubmitting,
  }) {
    return LoginState(
      identifier: identifier ?? this.identifier,
      password: password ?? this.password,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}
