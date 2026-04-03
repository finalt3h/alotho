import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Result<User>> loginWithCredentials({
    required String identifier,
    required String password,
  });
  Future<Result<User>> loginWithGoogle();
}
