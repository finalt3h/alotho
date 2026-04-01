// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_listing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkListingModelImpl _$$WorkListingModelImplFromJson(
  Map<String, dynamic> json,
) => _$WorkListingModelImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  categoryName: json['categoryName'] as String,
  area: json['area'] as String,
  visibleInCategory: json['visibleInCategory'] as String,
  viewCount: (json['viewCount'] as num).toInt(),
  contactCount: (json['contactCount'] as num).toInt(),
  postedAt: DateTime.parse(json['postedAt'] as String),
  statusLabel: json['statusLabel'] as String,
);

Map<String, dynamic> _$$WorkListingModelImplToJson(
  _$WorkListingModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'categoryName': instance.categoryName,
  'area': instance.area,
  'visibleInCategory': instance.visibleInCategory,
  'viewCount': instance.viewCount,
  'contactCount': instance.contactCount,
  'postedAt': instance.postedAt.toIso8601String(),
  'statusLabel': instance.statusLabel,
};
