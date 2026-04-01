import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_listing.freezed.dart';

@freezed
class WorkListing with _$WorkListing {
  const factory WorkListing({
    required String id,
    required String title,
    required String categoryName,
    required String area,
    required String visibleInCategory,
    required int viewCount,
    required int contactCount,
    required DateTime postedAt,
    required String statusLabel,
  }) = _WorkListing;
}
