import 'package:alo_tho/features/auth/data/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteDataSourceProvider = Provider<MockAuthRemoteDataSource>(
  (ref) => const MockAuthRemoteDataSource(),
);

/// Mock auth source to keep the first iteration fully offline.
class MockAuthRemoteDataSource {
  const MockAuthRemoteDataSource();

  Future<UserModel> loginWithCredentials({
    required String identifier,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 800));

    final normalizedIdentifier = identifier.trim();
    final phoneNumber = normalizedIdentifier.contains('@')
        ? '0901234567'
        : normalizedIdentifier;

    return UserModel(
      id: 'user-001',
      fullName: 'Nguyen Minh Anh',
      phoneNumber: phoneNumber,
      city: 'Quan 7, TP. Ho Chi Minh',
      isWorker: false,
      avatarUrl: 'https://i.pravatar.cc/160?img=32',
      joinedAt: DateTime(2024, 5, 18),
    );
  }

  Future<UserModel> loginWithGoogle() async {
    await Future<void>.delayed(const Duration(milliseconds: 700));

    return UserModel(
      id: 'user-002',
      fullName: 'Tran Quynh Nhu',
      phoneNumber: '0901234567',
      city: 'Thu Duc, TP. Ho Chi Minh',
      isWorker: false,
      avatarUrl: 'https://i.pravatar.cc/160?img=47',
      joinedAt: DateTime(2024, 8, 5),
    );
  }
}
