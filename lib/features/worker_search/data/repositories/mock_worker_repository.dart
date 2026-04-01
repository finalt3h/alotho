import 'package:alo_tho/core/errors/failure.dart';
import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/worker_search/data/datasources/mock_worker_data_source.dart';
import 'package:alo_tho/features/worker_search/domain/entities/service_category.dart';
import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';
import 'package:alo_tho/features/worker_search/domain/repositories/worker_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workerRepositoryProvider = Provider<WorkerRepository>((ref) {
  final dataSource = ref.watch(workerDataSourceProvider);
  return MockWorkerRepository(dataSource);
});

class MockWorkerRepository implements WorkerRepository {
  MockWorkerRepository(this._dataSource);

  final MockWorkerDataSource _dataSource;

  @override
  Future<Result<List<ServiceCategory>>> getServiceCategories() async {
    try {
      final categories = await _dataSource.getServiceCategories();
      return Success(categories.map((item) => item.toEntity()).toList());
    } catch (_) {
      return const Error(Failure('Khong tai duoc danh muc dich vu.'));
    }
  }

  @override
  Future<Result<Worker>> getWorkerById(String workerId) async {
    try {
      final workers = await _dataSource.getWorkers();
      final worker = workers.firstWhere(
        (item) => item.id == workerId,
        orElse: () => throw StateError('not found'),
      );
      return Success(worker.toEntity());
    } catch (_) {
      return const Error(Failure('Khong tim thay thong tin tho.'));
    }
  }

  @override
  Future<Result<List<Worker>>> getWorkers() async {
    try {
      final workers = await _dataSource.getWorkers();
      return Success(workers.map((item) => item.toEntity()).toList());
    } catch (_) {
      return const Error(Failure('Khong tai duoc danh sach tho.'));
    }
  }
}
