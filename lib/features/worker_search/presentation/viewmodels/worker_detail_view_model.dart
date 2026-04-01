import 'package:alo_tho/features/worker_search/data/repositories/mock_worker_repository.dart';
import 'package:alo_tho/features/worker_search/presentation/viewmodels/worker_detail_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workerDetailControllerProvider =
    NotifierProvider.family<WorkerDetailController, WorkerDetailState, String>(
      WorkerDetailController.new,
    );

class WorkerDetailController extends FamilyNotifier<WorkerDetailState, String> {
  bool _didBootstrap = false;

  @override
  WorkerDetailState build(String arg) {
    if (!_didBootstrap) {
      _didBootstrap = true;
      Future<void>.microtask(load);
    }

    return const WorkerDetailState();
  }

  Future<void> load() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final result = await ref.read(workerRepositoryProvider).getWorkerById(arg);

    state = result.when(
      success: (worker) => state.copyWith(isLoading: false, worker: worker),
      failure: (failure) =>
          state.copyWith(isLoading: false, errorMessage: failure.message),
    );
  }
}
