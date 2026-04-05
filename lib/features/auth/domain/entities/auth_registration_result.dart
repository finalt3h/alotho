import 'package:alo_tho/features/auth/domain/entities/user.dart';

class AuthRegistrationResult {
  const AuthRegistrationResult({required this.hasActiveSession, this.user});

  final bool hasActiveSession;
  final User? user;
}
