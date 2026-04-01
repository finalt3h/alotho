import 'package:alo_tho/core/constants/app_constants.dart';
import 'package:alo_tho/features/auth/domain/entities/user.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authSessionControllerProvider =
    NotifierProvider<AuthSessionController, AuthSessionState>(
      AuthSessionController.new,
    );

class AuthSessionController extends Notifier<AuthSessionState> {
  bool _didBootstrap = false;

  @override
  AuthSessionState build() {
    if (!_didBootstrap) {
      _didBootstrap = true;
      Future<void>.microtask(_bootstrap);
    }

    return AuthSessionState.initial();
  }

  Future<void> _bootstrap() async {
    await Future<void>.delayed(AppConstants.splashDuration);

    if (state.status == AuthStatus.unknown) {
      markUnauthenticated();
    }
  }

  void markUnauthenticated() {
    state = const AuthSessionState(status: AuthStatus.unauthenticated);
  }

  void signIn(User user) {
    state = AuthSessionState(status: AuthStatus.authenticated, user: user);
  }

  void signOut() {
    state = const AuthSessionState(status: AuthStatus.unauthenticated);
  }
}
