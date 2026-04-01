import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/worker_search/data/repositories/mock_worker_repository.dart';
import 'package:alo_tho/features/worker_search/domain/entities/service_category.dart';
import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';
import 'package:alo_tho/features/worker_search/domain/repositories/worker_repository.dart';
import 'package:alo_tho/features/worker_search/presentation/viewmodels/worker_search_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('loads workers and filters by query', () async {
    final container = ProviderContainer(
      overrides: [
        workerRepositoryProvider.overrideWithValue(_FakeWorkerRepository()),
      ],
    );
    addTearDown(container.dispose);

    final notifier = container.read(workerSearchControllerProvider.notifier);

    await notifier.load();
    notifier.updateSearchQuery('dien lanh');

    final state = container.read(workerSearchControllerProvider);

    expect(state.isLoading, isFalse);
    expect(state.categories.length, 2);
    expect(state.filteredWorkers.length, 1);
    expect(state.filteredWorkers.first.fullName, 'Do Duc Hai');
  });
}

class _FakeWorkerRepository implements WorkerRepository {
  @override
  Future<Result<Worker>> getWorkerById(String workerId) async {
    return Success(_workers.first);
  }

  @override
  Future<Result<List<ServiceCategory>>> getServiceCategories() async {
    return const Success([
      ServiceCategory(
        id: 'electric',
        name: 'Dien',
        iconName: 'bolt',
        description: 'Sua dien',
      ),
      ServiceCategory(
        id: 'aircon',
        name: 'Dien lanh',
        iconName: 'ac_unit',
        description: 'Sua may lanh',
      ),
    ]);
  }

  @override
  Future<Result<List<Worker>>> getWorkers() async {
    return Success(_workers);
  }
}

final _workers = [
  const Worker(
    id: 'w1',
    fullName: 'Le Van Khoa',
    age: 32,
    professionTitle: 'Tho dien dan dung',
    serviceCategoryId: 'electric',
    area: 'Quan 7',
    yearsOfExperience: 8,
    rating: 4.8,
    completedJobs: 120,
    distanceInKm: 2.2,
    priceDescription: 'Tu 150.000d',
    shortBio: 'Sua dien',
  ),
  const Worker(
    id: 'w2',
    fullName: 'Do Duc Hai',
    age: 36,
    professionTitle: 'Tho dien lanh',
    serviceCategoryId: 'aircon',
    area: 'Thu Duc',
    yearsOfExperience: 10,
    rating: 4.9,
    completedJobs: 220,
    distanceInKm: 4.1,
    priceDescription: 'Tu 250.000d',
    shortBio: 'Sua may lanh',
  ),
];
