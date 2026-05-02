import 'package:alo_tho/core/utils/json_readers.dart';
import 'package:alo_tho/features/home/domain/entities/work_listing.dart';

class WorkListingModel {
  const WorkListingModel({
    required this.id,
    required this.title,
    required this.categoryName,
    required this.area,
    required this.visibleInCategory,
    required this.viewCount,
    required this.contactCount,
    required this.postedAt,
    required this.statusLabel,
  });

  final String id;
  final String title;
  final String categoryName;
  final String area;
  final String visibleInCategory;
  final int viewCount;
  final int contactCount;
  final DateTime postedAt;
  final String statusLabel;

  factory WorkListingModel.fromJson(Map<String, dynamic> json) =>
      WorkListingModel(
        id: readString(json, 'id'),
        title: readString(json, 'title'),
        categoryName: readString(json, 'categoryName'),
        area: readString(json, 'area'),
        visibleInCategory: readString(json, 'visibleInCategory'),
        viewCount: readInt(json, 'viewCount'),
        contactCount: readInt(json, 'contactCount'),
        postedAt: readDateTime(json, 'postedAt'),
        statusLabel: readString(json, 'statusLabel'),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'categoryName': categoryName,
    'area': area,
    'visibleInCategory': visibleInCategory,
    'viewCount': viewCount,
    'contactCount': contactCount,
    'postedAt': postedAt.toIso8601String(),
    'statusLabel': statusLabel,
  };

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
