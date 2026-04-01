import 'package:alo_tho/features/auth/domain/entities/user.dart';
import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_summary.freezed.dart';

@freezed
class ProfileSummary with _$ProfileSummary {
  const factory ProfileSummary({
    required User user,
    Worker? workerProfile,
    required bool isKycSubmitted,
    required bool isKycApproved,
  }) = _ProfileSummary;
}
