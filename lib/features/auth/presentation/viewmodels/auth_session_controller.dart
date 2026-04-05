import 'dart:async';

import 'package:alo_tho/core/constants/app_constants.dart';
import 'package:alo_tho/features/auth/data/repositories/supabase_auth_repository.dart';
import 'package:alo_tho/features/auth/domain/entities/user.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authSessionControllerProvider =
    NotifierProvider<AuthSessionController, AuthSessionState>(
      AuthSessionController.new,
    );

class AuthSessionController extends Notifier<AuthSessionState> {
  bool _didBootstrap = false;
  StreamSubscription<User?>? _authSubscription;

  @override
  AuthSessionState build() {
    if (!_didBootstrap) {
      _didBootstrap = true;
      Future<void>.microtask(_bootstrap);
      _authSubscription = ref
          .read(authRepositoryProvider)
          .authStateChanges()
          .listen(_syncAuthState);
      ref.onDispose(() => _authSubscription?.cancel());
    }

    return AuthSessionState.initial();
  }

  Future<void> _bootstrap() async {
    await Future<void>.delayed(AppConstants.splashDuration);

    if (state.status == AuthStatus.unknown) {
      final currentUser = await ref
          .read(authRepositoryProvider)
          .getCurrentUser();
      _syncAuthState(currentUser);
    }
  }

  void markUnauthenticated() {
    state = const AuthSessionState(status: AuthStatus.unauthenticated);
  }

  void signIn(User user) {
    state = AuthSessionState(status: AuthStatus.authenticated, user: user);
  }

  Future<void> signOut() async {
    await ref.read(authRepositoryProvider).signOut();

    if (state.status != AuthStatus.unauthenticated) {
      markUnauthenticated();
    }
  }

  void _syncAuthState(User? user) {
    if (user == null) {
      markUnauthenticated();
      return;
    }

    signIn(user);
  }
}
