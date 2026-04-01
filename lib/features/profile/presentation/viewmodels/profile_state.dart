import 'package:alo_tho/features/profile/domain/entities/profile_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(true) bool isLoading,
    String? errorMessage,
    ProfileSummary? summary,
  }) = _ProfileState;
}
