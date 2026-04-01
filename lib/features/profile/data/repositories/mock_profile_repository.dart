import 'package:alo_tho/core/errors/failure.dart';
import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/profile/data/datasources/mock_profile_data_source.dart';
import 'package:alo_tho/features/profile/domain/entities/profile_summary.dart';
import 'package:alo_tho/features/profile/domain/repositories/profile_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final dataSource = ref.watch(profileDataSourceProvider);
  return MockProfileRepository(dataSource);
});

class MockProfileRepository implements ProfileRepository {
  MockProfileRepository(this._dataSource);

  final MockProfileDataSource _dataSource;

  @override
  Future<Result<ProfileSummary>> getProfileSummary() async {
    try {
      final summary = await _dataSource.getProfileSummary();
      return Success(summary.toEntity());
    } catch (_) {
      return const Error(Failure('Khong tai duoc thong tin ho so.'));
    }
  }
}
