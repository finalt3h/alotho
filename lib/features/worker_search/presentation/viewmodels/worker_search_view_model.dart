import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/worker_search/data/repositories/mock_worker_repository.dart';
import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';
import 'package:alo_tho/features/worker_search/presentation/viewmodels/worker_search_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workerSearchControllerProvider =
    NotifierProvider<WorkerSearchController, WorkerSearchState>(
      WorkerSearchController.new,
    );

/// Owns search filters so the page stays focused on composition only.
class WorkerSearchController extends Notifier<WorkerSearchState> {
  bool _didBootstrap = false;

  @override
  WorkerSearchState build() {
    if (!_didBootstrap) {
      _didBootstrap = true;
      Future<void>.microtask(load);
    }

    return const WorkerSearchState();
  }

  Future<void> load() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final repository = ref.read(workerRepositoryProvider);
    final categoriesResult = await repository.getServiceCategories();
    final workersResult = await repository.getWorkers();

    switch ((categoriesResult, workersResult)) {
      case (Success(value: final categories), Success(value: final workers)):
        state = state.copyWith(
          isLoading: false,
          categories: categories,
          allWorkers: workers,
          suggestedAreas: _buildSuggestedAreas(workers),
          filteredWorkers: _applyFilters(
            workers: workers,
            query: state.searchQuery,
            selectedCategoryId: state.selectedCategoryId,
          ),
        );
      case (Error(failure: final failure), _):
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
      case (_, Error(failure: final failure)):
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
    }
  }

  void updateSearchQuery(String value) {
    state = state.copyWith(
      searchQuery: value,
      filteredWorkers: _applyFilters(
        workers: state.allWorkers,
        query: value,
        selectedCategoryId: state.selectedCategoryId,
      ),
    );
  }

  void selectCategory(String? categoryId) {
    final nextCategoryId = state.selectedCategoryId == categoryId
        ? null
        : categoryId;

    state = state.copyWith(
      selectedCategoryId: nextCategoryId,
      filteredWorkers: _applyFilters(
        workers: state.allWorkers,
        query: state.searchQuery,
        selectedCategoryId: nextCategoryId,
      ),
    );
  }

  void clearFilters() {
    state = state.copyWith(
      searchQuery: '',
      selectedCategoryId: null,
      filteredWorkers: _applyFilters(
        workers: state.allWorkers,
        query: '',
        selectedCategoryId: null,
      ),
    );
  }

  List<Worker> _applyFilters({
    required List<Worker> workers,
    required String query,
    required String? selectedCategoryId,
  }) {
    return workers.where((worker) {
      final matchesQuery =
          query.isEmpty ||
          worker.fullName.toLowerCase().contains(query.toLowerCase()) ||
          worker.professionTitle.toLowerCase().contains(query.toLowerCase()) ||
          worker.area.toLowerCase().contains(query.toLowerCase());
      final matchesCategory =
          selectedCategoryId == null ||
          worker.serviceCategoryId == selectedCategoryId;

      return matchesQuery && matchesCategory;
    }).toList();
  }

  List<String> _buildSuggestedAreas(List<Worker> workers) {
    final areas = workers.map((worker) => worker.area).toSet().toList()..sort();
    return areas.take(4).toList();
  }
}
