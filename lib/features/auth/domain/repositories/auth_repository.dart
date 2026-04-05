import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/auth/domain/entities/auth_registration_result.dart';
import 'package:alo_tho/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Result<AuthRegistrationResult>> registerWithCredentials({
    required String fullName,
    required String email,
    String? phoneNumber,
    required String password,
  });
  Future<Result<User>> verifyActivationOtp({
    required String identifier,
    required String token,
  });
  Future<Result<bool>> resendActivationOtp({required String identifier});
  Future<Result<User>> loginWithCredentials({
    required String identifier,
    required String password,
  });
  Future<Result<User>> loginWithGoogle();
  Future<User?> getCurrentUser();
  Stream<User?> authStateChanges();
  Future<void> signOut();
}
