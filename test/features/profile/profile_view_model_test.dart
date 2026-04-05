import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/auth/data/repositories/supabase_auth_repository.dart';
import 'package:alo_tho/features/auth/domain/entities/auth_registration_result.dart';
import 'package:alo_tho/features/auth/domain/entities/user.dart';
import 'package:alo_tho/features/auth/domain/repositories/auth_repository.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_controller.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_state.dart';
import 'package:alo_tho/features/profile/presentation/viewmodels/profile_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProfileController', () {
    test('signs out successfully from profile', () async {
      final fakeRepository = _FakeAuthRepository();
      final container = ProviderContainer(
        overrides: [authRepositoryProvider.overrideWithValue(fakeRepository)],
      );
      addTearDown(container.dispose);

      container.read(authSessionControllerProvider.notifier).signIn(_testUser);

      final notifier = container.read(profileControllerProvider.notifier);
      await notifier.signOut();

      final authState = container.read(authSessionControllerProvider);
      final profileState = container.read(profileControllerProvider);

      expect(fakeRepository.signOutCallCount, 1);
      expect(authState.status, AuthStatus.unauthenticated);
      expect(profileState.isSigningOut, isFalse);
      expect(profileState.signOutErrorMessage, isNull);
    });
  });
}

class _FakeAuthRepository implements AuthRepository {
  int signOutCallCount = 0;

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
    return Success(
      AuthRegistrationResult(
        hasActiveSession: true,
        user: _testUser.copyWith(
          fullName: fullName,
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
  Future<void> signOut() async {
    signOutCallCount += 1;
  }
}

final _testUser = User(
  id: 'test-user',
  fullName: 'Test User',
  phoneNumber: '0912345678',
  city: 'Thu Duc',
  isWorker: false,
  joinedAt: DateTime(2025, 1, 1),
);
