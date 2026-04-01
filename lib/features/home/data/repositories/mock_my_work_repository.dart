import 'package:alo_tho/core/errors/failure.dart';
import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/home/data/datasources/mock_my_work_data_source.dart';
import 'package:alo_tho/features/home/domain/entities/work_listing.dart';
import 'package:alo_tho/features/home/domain/repositories/my_work_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myWorkRepositoryProvider = Provider<MyWorkRepository>((ref) {
  final dataSource = ref.watch(myWorkDataSourceProvider);
  return MockMyWorkRepository(dataSource);
});

class MockMyWorkRepository implements MyWorkRepository {
  MockMyWorkRepository(this._dataSource);

  final MockMyWorkDataSource _dataSource;

  @override
  Future<Result<List<WorkListing>>> getMyWorkListings() async {
    try {
      final listings = await _dataSource.getMyWorkListings();
      return Success(listings.map((item) => item.toEntity()).toList());
    } catch (_) {
      return const Error(
        Failure('Khong tai duoc danh sach bai dang cong viec.'),
      );
    }
  }
}
