import 'package:alo_tho/features/auth/data/models/user_model.dart';
import 'package:alo_tho/features/profile/domain/entities/profile_summary.dart';
import 'package:alo_tho/features/worker_search/data/models/worker_model.dart';

class ProfileSummaryModel {
  const ProfileSummaryModel({
    required this.user,
    this.workerProfile,
    required this.isKycSubmitted,
    required this.isKycApproved,
  });

  final UserModel user;
  final WorkerModel? workerProfile;
  final bool isKycSubmitted;
  final bool isKycApproved;

  factory ProfileSummaryModel.fromJson(Map<String, dynamic> json) =>
      ProfileSummaryModel(
        user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
        workerProfile: json['workerProfile'] == null
            ? null
            : WorkerModel.fromJson(
                json['workerProfile'] as Map<String, dynamic>,
              ),
        isKycSubmitted: json['isKycSubmitted'] as bool? ?? false,
        isKycApproved: json['isKycApproved'] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {
    'user': user.toJson(),
    'workerProfile': workerProfile?.toJson(),
    'isKycSubmitted': isKycSubmitted,
    'isKycApproved': isKycApproved,
  };

  ProfileSummary toEntity() => ProfileSummary(
    user: user.toEntity(),
    workerProfile: workerProfile?.toEntity(),
    isKycSubmitted: isKycSubmitted,
    isKycApproved: isKycApproved,
  );
}
