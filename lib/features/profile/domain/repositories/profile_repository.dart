import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/profile/domain/entities/profile_summary.dart';

abstract interface class ProfileRepository {
  Future<Result<ProfileSummary>> getProfileSummary();
}
