import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_detail_state.freezed.dart';

@freezed
class WorkerDetailState with _$WorkerDetailState {
  const factory WorkerDetailState({
    @Default(true) bool isLoading,
    String? errorMessage,
    Worker? worker,
  }) = _WorkerDetailState;
}
