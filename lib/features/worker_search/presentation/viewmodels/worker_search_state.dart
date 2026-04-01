import 'package:alo_tho/features/worker_search/domain/entities/service_category.dart';
import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_search_state.freezed.dart';

@freezed
class WorkerSearchState with _$WorkerSearchState {
  const factory WorkerSearchState({
    @Default(true) bool isLoading,
    String? errorMessage,
    @Default([]) List<ServiceCategory> categories,
    @Default([]) List<Worker> allWorkers,
    @Default([]) List<Worker> filteredWorkers,
    @Default([]) List<String> suggestedAreas,
    @Default('') String searchQuery,
    String? selectedCategoryId,
  }) = _WorkerSearchState;
}
