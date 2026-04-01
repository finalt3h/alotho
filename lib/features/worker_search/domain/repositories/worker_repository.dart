import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/worker_search/domain/entities/service_category.dart';
import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';

abstract interface class WorkerRepository {
  Future<Result<List<ServiceCategory>>> getServiceCategories();
  Future<Result<List<Worker>>> getWorkers();
  Future<Result<Worker>> getWorkerById(String workerId);
}
