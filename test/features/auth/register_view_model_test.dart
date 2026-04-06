import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/auth/data/repositories/supabase_auth_repository.dart';
import 'package:alo_tho/features/auth/domain/entities/auth_registration_result.dart';
import 'package:alo_tho/features/auth/domain/entities/user.dart';
import 'package:alo_tho/features/auth/domain/repositories/auth_repository.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_controller.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_state.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/register_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RegisterController', () {
    test('rejects mismatched confirmation password', () async {
      final fakeRepository = _FakeAuthRepository();
      final container = ProviderContainer(
        overrides: [authRepositoryProvider.overrideWithValue(fakeRepository)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(registerControllerProvider.notifier);
      notifier.updateFullName('Test User');
      notifier.updateEmail('test@example.com');
      notifier.updatePassword('123456');
      notifier.updateConfirmPassword('654321');

      final result = await notifier.registerWithCredentials();
      final state = container.read(registerControllerProvider);

      expect(result, isNull);
      expect(state.errorMessage, 'Mat khau xac nhan khong khop.');
      expect(fakeRepository.registerCallCount, 0);
    });

    test('signs in immediately when sign up returns active session', () async {
      final fakeRepository = _FakeAuthRepository();
      final container = ProviderContainer(
        overrides: [authRepositoryProvider.overrideWithValue(fakeRepository)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(registerControllerProvider.notifier);
      notifier.updateFullName('Test User');
      notifier.updateEmail('test@example.com');
      notifier.updatePassword('123456');
      notifier.updateConfirmPassword('123456');

      final result = await notifier.registerWithCredentials();
      final authState = container.read(authSessionControllerProvider);

      expect(result, isNotNull);
      expect(result!.hasActiveSession, isTrue);
      expect(fakeRepository.registerCallCount, 1);
      expect(authState.status, AuthStatus.authenticated);
      expect(authState.user?.fullName, 'Test User');
    });

    test('signs in successfully with Google', () async {
      final fakeRepository = _FakeAuthRepository();
      final container = ProviderContainer(
        overrides: [authRepositoryProvider.overrideWithValue(fakeRepository)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(registerControllerProvider.notifier);

      final result = await notifier.loginWithGoogle();
      final authState = container.read(authSessionControllerProvider);

      expect(result, isNotNull);
      expect(fakeRepository.googleLoginCallCount, 1);
      expect(authState.status, AuthStatus.authenticated);
      expect(authState.user?.fullName, 'Test User');
    });
  });
}

class _FakeAuthRepository implements AuthRepository {
  int registerCallCount = 0;
  int googleLoginCallCount = 0;

  @override
  Stream<User?> authStateChanges() => const Stream.empty();

  @override
  Future<User?> getCurrentUser() async => null;

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
    return Success(_testUser.copyWith(phoneNumber: identifier));
  }

  @override
  Future<Result<AuthRegistrationResult>> registerWithCredentials({
    required String fullName,
    required String email,
    String? phoneNumber,
    required String password,
    required bool isWorker,
  }) async {
    registerCallCount += 1;
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
