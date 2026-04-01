import 'package:alo_tho/features/home/domain/entities/work_listing.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_listing_model.freezed.dart';
part 'work_listing_model.g.dart';

@freezed
class WorkListingModel with _$WorkListingModel {
  const WorkListingModel._();

  const factory WorkListingModel({
    required String id,
    required String title,
    required String categoryName,
    required String area,
    required String visibleInCategory,
    required int viewCount,
    required int contactCount,
    required DateTime postedAt,
    required String statusLabel,
  }) = _WorkListingModel;

  factory WorkListingModel.fromJson(Map<String, dynamic> json) =>
      _$WorkListingModelFromJson(json);

  WorkListing toEntity() => WorkListing(
    id: id,
    title: title,
    categoryName: categoryName,
    area: area,
    visibleInCategory: visibleInCategory,
    viewCount: viewCount,
    contactCount: contactCount,
    postedAt: postedAt,
    statusLabel: statusLabel,
  );
}
