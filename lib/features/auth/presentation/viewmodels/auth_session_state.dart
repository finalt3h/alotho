import 'package:alo_tho/features/auth/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_session_state.freezed.dart';

enum AuthStatus { unknown, unauthenticated, authenticated }

@freezed
class AuthSessionState with _$AuthSessionState {
  const factory AuthSessionState({required AuthStatus status, User? user}) =
      _AuthSessionState;

  factory AuthSessionState.initial() =>
      const AuthSessionState(status: AuthStatus.unknown);
}
