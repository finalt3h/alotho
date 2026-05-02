import 'package:alo_tho/core/utils/json_readers.dart';
import 'package:alo_tho/features/worker_search/domain/entities/service_category.dart';

class ServiceCategoryModel {
  const ServiceCategoryModel({
    required this.id,
    required this.name,
    required this.iconName,
    required this.description,
  });

  final String id;
  final String name;
  final String iconName;
  final String description;

  factory ServiceCategoryModel.fromJson(Map<String, dynamic> json) {
    return ServiceCategoryModel(
      id: readString(json, 'id'),
      name: readString(json, 'name'),
      iconName: readString(json, 'iconName', fallbackKey: 'icon_name'),
      description: readString(json, 'description'),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'iconName': iconName,
    'description': description,
  };

  ServiceCategory toEntity() => ServiceCategory(
    id: id,
    name: name,
    iconName: iconName,
    description: description,
  );
}
