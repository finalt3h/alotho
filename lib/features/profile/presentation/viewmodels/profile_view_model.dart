import 'dart:async';

import 'package:alo_tho/core/effects/ui_effect.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_controller.dart';
import 'package:alo_tho/features/profile/data/repositories/mock_profile_repository.dart';
import 'package:alo_tho/features/profile/presentation/viewmodels/profile_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileControllerProvider =
    NotifierProvider<ProfileController, ProfileState>(ProfileController.new);

final profileUiActionProvider = StreamProvider<UiEffect>((ref) {
  return ref.watch(profileControllerProvider.notifier).actions;
});

class ProfileController extends Notifier<ProfileState> {
  bool _didBootstrap = false;
  final StreamController<UiEffect> _actionsController =
      StreamController<UiEffect>.broadcast();

  Stream<UiEffect> get actions => _actionsController.stream;

  @override
  ProfileState build() {
    ref.onDispose(_actionsController.close);
    if (!_didBootstrap) {
      _didBootstrap = true;
      Future<void>.microtask(load);
    }

    return const ProfileState();
  }

  Future<void> load() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final result = await ref
        .read(profileRepositoryProvider)
        .getProfileSummary();

    state = result.when(
      success: (summary) => state.copyWith(isLoading: false, summary: summary),
      failure: (failure) =>
          state.copyWith(isLoading: false, errorMessage: failure.message),
    );
  }

  Future<void> signOut() async {
    if (state.isSigningOut) {
      return;
    }

    state = state.copyWith(isSigningOut: true);

    try {
      await ref.read(authSessionControllerProvider.notifier).signOut();
      state = state.copyWith(isSigningOut: false);
    } catch (_) {
      state = state.copyWith(isSigningOut: false);
      if (!_actionsController.isClosed) {
        _actionsController.add(
          const ShowErrorMessage('Khong the dang xuat luc nay.'),
        );
      }
    }
  }
}
