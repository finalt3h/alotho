import 'package:alo_tho/core/errors/failure.dart';
import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/auth/data/datasources/mock_auth_remote_data_source.dart';
import 'package:alo_tho/features/auth/domain/entities/auth_registration_result.dart';
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
  Stream<User?> authStateChanges() => const Stream.empty();

  @override
  Future<User?> getCurrentUser() async => null;

  @override
  Future<Result<AuthRegistrationResult>> registerWithCredentials({
    required String fullName,
    required String email,
    String? phoneNumber,
    required String password,
  }) async {
    try {
      final user = await _remoteDataSource.registerWithCredentials(
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );
      return Success(
        AuthRegistrationResult(hasActiveSession: true, user: user.toEntity()),
      );
    } catch (_) {
      return const Error(Failure('Khong the tao tai khoan luc nay.'));
    }
  }

  @override
  Future<Result<User>> verifyActivationOtp({
    required String identifier,
    required String token,
  }) async {
    try {
      final user = await _remoteDataSource.verifyActivationOtp(
        identifier: identifier,
        token: token,
      );
      return Success(user.toEntity());
    } catch (_) {
      return const Error(Failure('Xac thuc OTP khong thanh cong.'));
    }
  }

  @override
  Future<Result<bool>> resendActivationOtp({required String identifier}) async {
    try {
      await _remoteDataSource.resendActivationOtp(identifier: identifier);
      return const Success(true);
    } catch (_) {
      return const Error(Failure('Khong the gui lai ma OTP luc nay.'));
    }
  }

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

  @override
  Future<void> signOut() async {}
}
