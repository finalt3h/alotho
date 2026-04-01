import 'package:alo_tho/features/home/data/repositories/mock_my_work_repository.dart';
import 'package:alo_tho/features/home/presentation/viewmodels/my_work_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myWorkControllerProvider =
    NotifierProvider<MyWorkController, MyWorkState>(MyWorkController.new);

class MyWorkController extends Notifier<MyWorkState> {
  bool _didBootstrap = false;

  @override
  MyWorkState build() {
    if (!_didBootstrap) {
      _didBootstrap = true;
      Future<void>.microtask(load);
    }

    return const MyWorkState();
  }

  Future<void> load() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final result = await ref.read(myWorkRepositoryProvider).getMyWorkListings();

    state = result.when(
      success: (listings) =>
          state.copyWith(isLoading: false, listings: listings),
      failure: (failure) =>
          state.copyWith(isLoading: false, errorMessage: failure.message),
    );
  }
}
