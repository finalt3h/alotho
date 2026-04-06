import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/auth/data/repositories/supabase_auth_repository.dart';
import 'package:alo_tho/features/auth/domain/entities/auth_registration_result.dart';
import 'package:alo_tho/features/auth/domain/entities/user.dart';
import 'package:alo_tho/features/auth/domain/repositories/auth_repository.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_controller.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_state.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/login_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginController', () {
    test('rejects invalid identifier before calling repository', () async {
      final fakeRepository = _FakeAuthRepository();
      final container = ProviderContainer(
        overrides: [authRepositoryProvider.overrideWithValue(fakeRepository)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(loginControllerProvider.notifier);
      notifier.updateIdentifier('abc');
      notifier.updatePassword('123456');

      final result = await notifier.loginWithCredentials();
      final state = container.read(loginControllerProvider);

      expect(result, isFalse);
      expect(state.errorMessage, 'So dien thoai hoac email chua hop le.');
      expect(fakeRepository.credentialsLoginCallCount, 0);
    });

    test('signs in successfully with valid credentials', () async {
      final fakeRepository = _FakeAuthRepository();
      final container = ProviderContainer(
        overrides: [authRepositoryProvider.overrideWithValue(fakeRepository)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(loginControllerProvider.notifier);
      notifier.updateIdentifier('0912345678');
      notifier.updatePassword('123456');

      final result = await notifier.loginWithCredentials();
      final authState = container.read(authSessionControllerProvider);

      expect(result, isTrue);
      expect(fakeRepository.credentialsLoginCallCount, 1);
      expect(authState.status, AuthStatus.authenticated);
      expect(authState.user?.fullName, 'Test User');
    });

    test('signs in successfully with Google', () async {
      final fakeRepository = _FakeAuthRepository();
      final container = ProviderContainer(
        overrides: [authRepositoryProvider.overrideWithValue(fakeRepository)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(loginControllerProvider.notifier);

      final result = await notifier.loginWithGoogle();
      final authState = container.read(authSessionControllerProvider);

      expect(result, isTrue);
      expect(fakeRepository.googleLoginCallCount, 1);
      expect(authState.status, AuthStatus.authenticated);
      expect(authState.user?.fullName, 'Test User');
    });
  });
}

class _FakeAuthRepository implements AuthRepository {
  int credentialsLoginCallCount = 0;
  int googleLoginCallCount = 0;

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
    required bool isWorker,
  }) async {
    return Success(
      AuthRegistrationResult(
        hasActiveSession: true,
        user: _testUser.copyWith(
          fullName: fullName,
          isWorker: isWorker,
          phoneNumber: phoneNumber ?? _testUser.phoneNumber,
        ),
      ),
    );
  }

  @override
  Future<Result<User>> verifyActivationOtp({
    required String identifier,
    required String token,
  }) async {
    return Success(_testUser.copyWith(phoneNumber: identifier));
  }

  @override
  Future<Result<bool>> resendActivationOtp({required String identifier}) async {
    return const Success(true);
  }

  @override
  Future<Result<User>> loginWithGoogle() async {
    googleLoginCallCount += 1;
    return Success(_testUser);
  }

  @override
  Future<Result<User>> loginWithCredentials({
    required String identifier,
    required String password,
  }) async {
    credentialsLoginCallCount += 1;
    return Success(_testUser.copyWith(phoneNumber: identifier));
  }

  @override
  Future<void> signOut() async {}
}

final _testUser = User(
  id: 'test-user',
  fullName: 'Test User',
  phoneNumber: '0912345678',
  city: 'Thu Duc',
  isWorker: false,
  joinedAt: DateTime(2025, 1, 1),
);
