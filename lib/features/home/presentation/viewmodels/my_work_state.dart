import 'package:alo_tho/features/home/domain/entities/work_listing.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_work_state.freezed.dart';

@freezed
class MyWorkState with _$MyWorkState {
  const factory MyWorkState({
    @Default(true) bool isLoading,
    String? errorMessage,
    @Default([]) List<WorkListing> listings,
  }) = _MyWorkState;
}
