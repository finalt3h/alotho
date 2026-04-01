// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkerModelImpl _$$WorkerModelImplFromJson(Map<String, dynamic> json) =>
    _$WorkerModelImpl(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      age: (json['age'] as num).toInt(),
      professionTitle: json['professionTitle'] as String,
      serviceCategoryId: json['serviceCategoryId'] as String,
      area: json['area'] as String,
      yearsOfExperience: (json['yearsOfExperience'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      completedJobs: (json['completedJobs'] as num).toInt(),
      distanceInKm: (json['distanceInKm'] as num).toDouble(),
      priceDescription: json['priceDescription'] as String,
      shortBio: json['shortBio'] as String,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$$WorkerModelImplToJson(_$WorkerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'age': instance.age,
      'professionTitle': instance.professionTitle,
      'serviceCategoryId': instance.serviceCategoryId,
      'area': instance.area,
      'yearsOfExperience': instance.yearsOfExperience,
      'rating': instance.rating,
      'completedJobs': instance.completedJobs,
      'distanceInKm': instance.distanceInKm,
      'priceDescription': instance.priceDescription,
      'shortBio': instance.shortBio,
      'avatarUrl': instance.avatarUrl,
    };
