import 'package:alo_tho/core/utils/copy_with.dart';
import 'package:alo_tho/features/profile/domain/entities/profile_summary.dart';

class ProfileState {
  const ProfileState({
    this.isLoading = true,
    this.errorMessage,
    this.isSigningOut = false,
    this.summary,
  });

  final bool isLoading;
  final String? errorMessage;
  final bool isSigningOut;
  final ProfileSummary? summary;

  ProfileState copyWith({
    bool? isLoading,
    Object? errorMessage = copyWithUnchanged,
    bool? isSigningOut,
    Object? summary = copyWithUnchanged,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: copyWithNullable<String>(errorMessage, this.errorMessage),
      isSigningOut: isSigningOut ?? this.isSigningOut,
      summary: copyWithNullable<ProfileSummary>(summary, this.summary),
    );
  }
}
