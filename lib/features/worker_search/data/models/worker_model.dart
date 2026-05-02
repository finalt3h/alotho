import 'package:alo_tho/core/utils/json_readers.dart';
import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';

class WorkerModel {
  const WorkerModel({
    required this.id,
    required this.fullName,
    required this.age,
    required this.professionTitle,
    required this.serviceCategoryId,
    required this.area,
    required this.yearsOfExperience,
    required this.rating,
    required this.completedJobs,
    required this.distanceInKm,
    required this.priceDescription,
    required this.shortBio,
    this.avatarUrl,
  });

  final String id;
  final String fullName;
  final int age;
  final String professionTitle;
  final String serviceCategoryId;
  final String area;
  final int yearsOfExperience;
  final double rating;
  final int completedJobs;
  final double distanceInKm;
  final String priceDescription;
  final String shortBio;
  final String? avatarUrl;

  factory WorkerModel.fromJson(Map<String, dynamic> json) {
    return WorkerModel(
      id: readString(json, 'id'),
      fullName: readString(json, 'fullName', fallbackKey: 'full_name'),
      age: readInt(json, 'age'),
      professionTitle: readString(
        json,
        'professionTitle',
        fallbackKey: 'profession_title',
      ),
      serviceCategoryId: readString(
        json,
        'serviceCategoryId',
        fallbackKey: 'service_category_id',
      ),
      area: readString(json, 'area'),
      yearsOfExperience: readInt(json, 'yearsOfExperience'),
      rating: readDouble(json, 'rating'),
      completedJobs: readInt(json, 'completedJobs'),
      distanceInKm: readDouble(json, 'distanceInKm'),
      priceDescription: readString(json, 'priceDescription'),
      shortBio: readString(json, 'shortBio'),
      avatarUrl: json['avatarUrl'] as String? ?? json['avatar_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'fullName': fullName,
    'age': age,
    'professionTitle': professionTitle,
    'serviceCategoryId': serviceCategoryId,
    'area': area,
    'yearsOfExperience': yearsOfExperience,
    'rating': rating,
    'completedJobs': completedJobs,
    'distanceInKm': distanceInKm,
    'priceDescription': priceDescription,
    'shortBio': shortBio,
    'avatarUrl': avatarUrl,
  };

  Worker toEntity() => Worker(
    id: id,
    fullName: fullName,
    age: age,
    professionTitle: professionTitle,
    serviceCategoryId: serviceCategoryId,
    area: area,
    yearsOfExperience: yearsOfExperience,
    rating: rating,
    completedJobs: completedJobs,
    distanceInKm: distanceInKm,
    priceDescription: priceDescription,
    shortBio: shortBio,
    avatarUrl: avatarUrl,
  );
}
