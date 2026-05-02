import 'package:alo_tho/core/utils/copy_with.dart';
import 'package:alo_tho/features/auth/domain/entities/user.dart';

enum AuthStatus { unknown, unauthenticated, authenticated }

class AuthSessionState {
  const AuthSessionState({required this.status, this.user});

  factory AuthSessionState.initial() =>
      const AuthSessionState(status: AuthStatus.unknown);

  final AuthStatus status;
  final User? user;

  AuthSessionState copyWith({
    AuthStatus? status,
    Object? user = copyWithUnchanged,
  }) {
    return AuthSessionState(
      status: status ?? this.status,
      user: copyWithNullable<User>(user, this.user),
    );
  }
}
