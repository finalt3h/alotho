import 'package:alo_tho/core/utils/copy_with.dart';
import 'package:alo_tho/features/auth/domain/entities/user.dart';
import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';

class ProfileSummary {
  const ProfileSummary({
    required this.user,
    this.workerProfile,
    required this.isKycSubmitted,
    required this.isKycApproved,
  });

  final User user;
  final Worker? workerProfile;
  final bool isKycSubmitted;
  final bool isKycApproved;

  ProfileSummary copyWith({
    User? user,
    Object? workerProfile = copyWithUnchanged,
    bool? isKycSubmitted,
    bool? isKycApproved,
  }) {
    return ProfileSummary(
      user: user ?? this.user,
      workerProfile: copyWithNullable<Worker>(
        workerProfile,
        this.workerProfile,
      ),
      isKycSubmitted: isKycSubmitted ?? this.isKycSubmitted,
      isKycApproved: isKycApproved ?? this.isKycApproved,
    );
  }
}
