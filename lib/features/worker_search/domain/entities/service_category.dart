import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_category.freezed.dart';

@freezed
class ServiceCategory with _$ServiceCategory {
  const factory ServiceCategory({
    required String id,
    required String name,
    required String iconName,
    required String description,
  }) = _ServiceCategory;
}
