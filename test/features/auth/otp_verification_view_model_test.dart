import 'package:alo_tho/core/effects/ui_effect.dart';
import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/auth/data/repositories/supabase_auth_repository.dart';
import 'package:alo_tho/features/auth/domain/entities/auth_registration_result.dart';
import 'package:alo_tho/features/auth/domain/entities/user.dart';
import 'package:alo_tho/features/auth/domain/repositories/auth_repository.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_controller.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_state.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/otp_verification_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OtpVerificationController', () {
    test('verifies otp and signs user in', () async {
      final fakeRepository = _FakeAuthRepository();
      final container = ProviderContainer(
        overrides: [authRepositoryProvider.overrideWithValue(fakeRepository)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(
        otpVerificationControllerProvider.notifier,
      );
      notifier.updateOtp('123456');

      final result = await notifier.verifyActivationOtp(
        identifier: 'test@example.com',
      );
      final authState = container.read(authSessionControllerProvider);

      expect(result, isTrue);
      expect(fakeRepository.verifyOtpCallCount, 1);
      expect(authState.status, AuthStatus.authenticated);
    });

    test('resends otp successfully', () async {
      final fakeRepository = _FakeAuthRepository();
      final container = ProviderContainer(
        overrides: [authRepositoryProvider.overrideWithValue(fakeRepository)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(
        otpVerificationControllerProvider.notifier,
      );
      final emittedActions = <UiEffect>[];
      final subscription = notifier.actions.listen(emittedActions.add);
      addTearDown(subscription.cancel);

      final result = await notifier.resendActivationOtp(
        identifier: 'test@example.com',
      );
      await Future<void>.delayed(Duration.zero);

      expect(result, isTrue);
      expect(fakeRepository.resendOtpCallCount, 1);
      expect(emittedActions, hasLength(1));
      expect(
        emittedActions.single,
        isA<ShowSuccessMessage>().having(
          (action) => action.message,
          'message',
          'Da gui lai ma OTP.',
        ),
      );
    });
  });
}

class _FakeAuthRepository implements AuthRepository {
  int verifyOtpCallCount = 0;
  int resendOtpCallCount = 0;

  @override
  Stream<User?> authStateChanges() => const Stream.empty();

  @override
  Future<User?> getCurrentUser() async => null;

  @override
  Future<Result<User>> loginWithGoogle() async => Success(_testUser);

  @override
  Future<Result<User>> loginWithCredentials({
    required String identifier,
    required String password,
  }) async {
    return Success(_testUser);
  }

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
        hasActiveSession: false,
        user: _testUser.copyWith(
          fullName: fullName,
          isWorker: isWorker,
          phoneNumber: phoneNumber ?? _testUser.phoneNumber,
        ),
      ),
    );
  }

  @override
  Future<Result<bool>> resendActivationOtp({required String identifier}) async {
    resendOtpCallCount += 1;
    return const Success(true);
  }

  @override
  Future<void> signOut() async {}

  @override
  Future<Result<User>> verifyActivationOtp({
    required String identifier,
    required String token,
  }) async {
    verifyOtpCallCount += 1;
    return Success(_testUser.copyWith(phoneNumber: identifier));
  }
}

final _testUser = User(
  id: 'otp-user',
  fullName: 'OTP User',
  phoneNumber: '0912345678',
  city: 'Thu Duc',
  isWorker: false,
  joinedAt: DateTime(2025, 1, 1),
);
