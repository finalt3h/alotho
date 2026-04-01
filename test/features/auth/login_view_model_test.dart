import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/auth/data/repositories/mock_auth_repository.dart';
import 'package:alo_tho/features/auth/domain/entities/user.dart';
import 'package:alo_tho/features/auth/domain/repositories/auth_repository.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_controller.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_state.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/login_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginController', () {
    test('rejects invalid phone number before calling repository', () async {
      final fakeRepository = _FakeAuthRepository();
      final container = ProviderContainer(
        overrides: [authRepositoryProvider.overrideWithValue(fakeRepository)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(loginControllerProvider.notifier);
      notifier.updatePhoneNumber('123');

      final result = await notifier.loginWithPhone();
      final state = container.read(loginControllerProvider);

      expect(result, isFalse);
      expect(state.errorMessage, 'So dien thoai chua hop le.');
      expect(fakeRepository.phoneLoginCallCount, 0);
    });

    test('signs in successfully with valid phone number', () async {
      final fakeRepository = _FakeAuthRepository();
      final container = ProviderContainer(
        overrides: [authRepositoryProvider.overrideWithValue(fakeRepository)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(loginControllerProvider.notifier);
      notifier.updatePhoneNumber('0912345678');

      final result = await notifier.loginWithPhone();
      final authState = container.read(authSessionControllerProvider);

      expect(result, isTrue);
      expect(fakeRepository.phoneLoginCallCount, 1);
      expect(authState.status, AuthStatus.authenticated);
      expect(authState.user?.fullName, 'Test User');
    });
  });
}

class _FakeAuthRepository implements AuthRepository {
  int phoneLoginCallCount = 0;

  @override
  Future<Result<User>> loginWithGoogle() async {
    return Success(_testUser);
  }

  @override
  Future<Result<User>> loginWithPhone(String phoneNumber) async {
    phoneLoginCallCount += 1;
    return Success(_testUser.copyWith(phoneNumber: phoneNumber));
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
