import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_controller.dart';
import 'package:alo_tho/features/profile/data/repositories/mock_profile_repository.dart';
import 'package:alo_tho/features/profile/presentation/viewmodels/profile_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileControllerProvider =
    NotifierProvider<ProfileController, ProfileState>(ProfileController.new);

class ProfileController extends Notifier<ProfileState> {
  bool _didBootstrap = false;

  @override
  ProfileState build() {
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

  void signOut() {
    ref.read(authSessionControllerProvider.notifier).signOut();
  }
}
