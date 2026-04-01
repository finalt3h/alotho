import 'package:alo_tho/features/worker_search/domain/entities/service_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_category_model.freezed.dart';
part 'service_category_model.g.dart';

@freezed
class ServiceCategoryModel with _$ServiceCategoryModel {
  const ServiceCategoryModel._();

  const factory ServiceCategoryModel({
    required String id,
    required String name,
    required String iconName,
    required String description,
  }) = _ServiceCategoryModel;

  factory ServiceCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoryModelFromJson(json);

  ServiceCategory toEntity() => ServiceCategory(
    id: id,
    name: name,
    iconName: iconName,
    description: description,
  );
}
