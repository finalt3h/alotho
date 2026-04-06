import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default('') String fullName,
    @Default('') String email,
    @Default('') String phoneNumber,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default(false) bool isWorker,
    @Default(false) bool isSubmitting,
    String? errorMessage,
  }) = _RegisterState;
}
