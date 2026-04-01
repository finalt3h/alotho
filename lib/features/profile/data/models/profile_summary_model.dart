import 'package:alo_tho/features/auth/data/models/user_model.dart';
import 'package:alo_tho/features/profile/domain/entities/profile_summary.dart';
import 'package:alo_tho/features/worker_search/data/models/worker_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_summary_model.freezed.dart';
part 'profile_summary_model.g.dart';

@freezed
class ProfileSummaryModel with _$ProfileSummaryModel {
  const ProfileSummaryModel._();

  const factory ProfileSummaryModel({
    required UserModel user,
    WorkerModel? workerProfile,
    required bool isKycSubmitted,
    required bool isKycApproved,
  }) = _ProfileSummaryModel;

  factory ProfileSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileSummaryModelFromJson(json);

  ProfileSummary toEntity() => ProfileSummary(
    user: user.toEntity(),
    workerProfile: workerProfile?.toEntity(),
    isKycSubmitted: isKycSubmitted,
    isKycApproved: isKycApproved,
  );
}
