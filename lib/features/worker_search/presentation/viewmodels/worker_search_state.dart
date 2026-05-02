import 'package:alo_tho/core/utils/copy_with.dart';
import 'package:alo_tho/features/worker_search/domain/entities/service_category.dart';
import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';

class WorkerSearchState {
  const WorkerSearchState({
    this.isLoading = true,
    this.errorMessage,
    this.categories = const [],
    this.allWorkers = const [],
    this.filteredWorkers = const [],
    this.suggestedAreas = const [],
    this.searchQuery = '',
    this.selectedCategoryId,
  });

  final bool isLoading;
  final String? errorMessage;
  final List<ServiceCategory> categories;
  final List<Worker> allWorkers;
  final List<Worker> filteredWorkers;
  final List<String> suggestedAreas;
  final String searchQuery;
  final String? selectedCategoryId;

  WorkerSearchState copyWith({
    bool? isLoading,
    Object? errorMessage = copyWithUnchanged,
    List<ServiceCategory>? categories,
    List<Worker>? allWorkers,
    List<Worker>? filteredWorkers,
    List<String>? suggestedAreas,
    String? searchQuery,
    Object? selectedCategoryId = copyWithUnchanged,
  }) {
    return WorkerSearchState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: copyWithNullable<String>(errorMessage, this.errorMessage),
      categories: categories ?? this.categories,
      allWorkers: allWorkers ?? this.allWorkers,
      filteredWorkers: filteredWorkers ?? this.filteredWorkers,
      suggestedAreas: suggestedAreas ?? this.suggestedAreas,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCategoryId: copyWithNullable<String>(
        selectedCategoryId,
        this.selectedCategoryId,
      ),
    );
  }
}
