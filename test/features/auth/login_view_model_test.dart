import 'package:alo_tho/core/effects/ui_effect.dart';
import 'package:alo_tho/core/errors/failure.dart';
import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/auth/data/datasources/login_identifier_local_data_source.dart';
import 'package:alo_tho/features/auth/data/repositories/supabase_auth_repository.dart';
import 'package:alo_tho/features/auth/domain/entities/auth_registration_result.dart';
import 'package:alo_tho/features/auth/domain/entities/user.dart';
import 'package:alo_tho/features/auth/domain/repositories/auth_repository.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_controller.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_state.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/login_ui_action.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/login_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginController', () {
    test('restores last login identifier on startup', () async {
      final fakeRepository = _FakeAuthRepository();
      final fakeLocalDataSource = _FakeLoginIdentifierLocalDataSource(
        lastIdentifier: 'last@example.com',
      );
      final container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWithValue(fakeRepository),
          loginIdentifierLocalDataSourceProvider.overrideWithValue(
            fakeLocalDataSource,
          ),
        ],
      );
      addTearDown(container.dispose);

      container.read(loginControllerProvider.notifier);
      await Future<void>.delayed(Duration.zero);

      final state = container.read(loginControllerProvider);
      expect(state.identifier, 'last@example.com');
      expect(fakeLocalDataSource.getCallCount, 1);
    });

    test('rejects invalid identifier before calling repository', () async {
      final fakeRepository = _FakeAuthRepository();
      final container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWithValue(fakeRepository),
          loginIdentifierLocalDataSourceProvider.overrideWithValue(
            _FakeLoginIdentifierLocalDataSource(),
          ),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(loginControllerProvider.notifier);
      notifier.updateIdentifier('abc');
      notifier.updatePassword('123456');
      final emittedActions = <UiEffect>[];
      final subscription = notifier.actions.listen(emittedActions.add);
      addTearDown(subscription.cancel);

      final result = await notifier.loginWithCredentials();
      await Future<void>.delayed(Duration.zero);

      expect(result, isFalse);
      expect(fakeRepository.credentialsLoginCallCount, 0);
      expect(emittedActions, hasLength(1));
      expect(
        emittedActions.single,
        isA<ShowErrorMessage>().having(
          (action) => action.message,
          'message',
          'So dien thoai hoac email chua hop le.',
        ),
      );
    });

    test('signs in successfully with valid credentials', () async {
      final fakeRepository = _FakeAuthRepository();
      final fakeLocalDataSource = _FakeLoginIdentifierLocalDataSource();
      final container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWithValue(fakeRepository),
          loginIdentifierLocalDataSourceProvider.overrideWithValue(
            fakeLocalDataSource,
          ),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(loginControllerProvider.notifier);
      notifier.updateIdentifier(' 0912345678 ');
      notifier.updatePassword('123456');

      final result = await notifier.loginWithCredentials();
      final authState = container.read(authSessionControllerProvider);

      expect(result, isTrue);
      expect(fakeRepository.credentialsLoginCallCount, 1);
      expect(authState.status, AuthStatus.authenticated);
      expect(authState.user?.fullName, 'Test User');
      expect(fakeLocalDataSource.savedIdentifier, '0912345678');
    });

    test('signs in successfully with Google', () async {
      final fakeRepository = _FakeAuthRepository();
      final container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWithValue(fakeRepository),
          loginIdentifierLocalDataSourceProvider.overrideWithValue(
            _FakeLoginIdentifierLocalDataSource(),
          ),
        ],
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

    test(
      'emits activation action when account requires otp activation',
      () async {
        final fakeRepository = _FakeAuthRepository()
          ..credentialsLoginResult = const Error(
            Failure(
              'Tai khoan chua kich hoat. Vui long nhap OTP de kich hoat.',
            ),
          );
        final container = ProviderContainer(
          overrides: [
            authRepositoryProvider.overrideWithValue(fakeRepository),
            loginIdentifierLocalDataSourceProvider.overrideWithValue(
              _FakeLoginIdentifierLocalDataSource(),
            ),
          ],
        );
        addTearDown(container.dispose);

        final notifier = container.read(loginControllerProvider.notifier);
        notifier.updateIdentifier('test@example.com');
        notifier.updatePassword('123456');
        final emittedActions = <UiEffect>[];
        final subscription = notifier.actions.listen(emittedActions.add);
        addTearDown(subscription.cancel);

        final result = await notifier.loginWithCredentials();
        await Future<void>.delayed(Duration.zero);

        expect(result, isFalse);
        expect(fakeRepository.credentialsLoginCallCount, 1);
        expect(emittedActions, hasLength(1));
        expect(
          emittedActions.single,
          isA<LoginRequiresActivationAction>()
              .having(
                (action) => action.identifier,
                'identifier',
                'test@example.com',
              )
              .having(
                (action) => action.message,
                'message',
                'Tai khoan chua kich hoat. Vui long nhap OTP de kich hoat.',
              ),
        );
      },
    );
  });
}

class _FakeLoginIdentifierLocalDataSource
    implements LoginIdentifierLocalDataSource {
  _FakeLoginIdentifierLocalDataSource({this.lastIdentifier = ''});

  final String lastIdentifier;
  int getCallCount = 0;
  String? savedIdentifier;

  @override
  Future<String> getLastLoginIdentifier() async {
    getCallCount += 1;
    return lastIdentifier;
  }

  @override
  Future<void> saveLastLoginIdentifier(String identifier) async {
    savedIdentifier = identifier.trim();
  }
}

class _FakeAuthRepository implements AuthRepository {
  int credentialsLoginCallCount = 0;
  int googleLoginCallCount = 0;
  Result<User> credentialsLoginResult = Success(_testUser);

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
    return credentialsLoginResult;
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
