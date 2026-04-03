import 'package:alo_tho/core/errors/failure.dart';
import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/auth/data/datasources/mock_auth_remote_data_source.dart';
import 'package:alo_tho/features/auth/domain/entities/user.dart';
import 'package:alo_tho/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  return MockAuthRepository(remoteDataSource);
});

class MockAuthRepository implements AuthRepository {
  MockAuthRepository(this._remoteDataSource);

  final MockAuthRemoteDataSource _remoteDataSource;

  @override
  Future<Result<User>> loginWithGoogle() async {
    try {
      final user = await _remoteDataSource.loginWithGoogle();
      return Success(user.toEntity());
    } catch (_) {
      return const Error(Failure('Khong the dang nhap voi Google luc nay.'));
    }
  }

  @override
  Future<Result<User>> loginWithCredentials({
    required String identifier,
    required String password,
  }) async {
    try {
      final user = await _remoteDataSource.loginWithCredentials(
        identifier: identifier,
        password: password,
      );
      return Success(user.toEntity());
    } catch (_) {
      return const Error(
        Failure('Khong the dang nhap bang so dien thoai hoac email.'),
      );
    }
  }
}
