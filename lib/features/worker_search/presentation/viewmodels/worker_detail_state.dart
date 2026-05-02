import 'package:alo_tho/core/utils/copy_with.dart';
import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';

class WorkerDetailState {
  const WorkerDetailState({
    this.isLoading = true,
    this.errorMessage,
    this.worker,
  });

  final bool isLoading;
  final String? errorMessage;
  final Worker? worker;

  WorkerDetailState copyWith({
    bool? isLoading,
    Object? errorMessage = copyWithUnchanged,
    Object? worker = copyWithUnchanged,
  }) {
    return WorkerDetailState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: copyWithNullable<String>(errorMessage, this.errorMessage),
      worker: copyWithNullable<Worker>(worker, this.worker),
    );
  }
}
