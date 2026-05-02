import 'package:alo_tho/core/utils/copy_with.dart';

class Worker {
  const Worker({
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

  Worker copyWith({
    String? id,
    String? fullName,
    int? age,
    String? professionTitle,
    String? serviceCategoryId,
    String? area,
    int? yearsOfExperience,
    double? rating,
    int? completedJobs,
    double? distanceInKm,
    String? priceDescription,
    String? shortBio,
    Object? avatarUrl = copyWithUnchanged,
  }) {
    return Worker(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      age: age ?? this.age,
      professionTitle: professionTitle ?? this.professionTitle,
      serviceCategoryId: serviceCategoryId ?? this.serviceCategoryId,
      area: area ?? this.area,
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
      rating: rating ?? this.rating,
      completedJobs: completedJobs ?? this.completedJobs,
      distanceInKm: distanceInKm ?? this.distanceInKm,
      priceDescription: priceDescription ?? this.priceDescription,
      shortBio: shortBio ?? this.shortBio,
      avatarUrl: copyWithNullable<String>(avatarUrl, this.avatarUrl),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Worker &&
          id == other.id &&
          fullName == other.fullName &&
          age == other.age &&
          professionTitle == other.professionTitle &&
          serviceCategoryId == other.serviceCategoryId &&
          area == other.area &&
          yearsOfExperience == other.yearsOfExperience &&
          rating == other.rating &&
          completedJobs == other.completedJobs &&
          distanceInKm == other.distanceInKm &&
          priceDescription == other.priceDescription &&
          shortBio == other.shortBio &&
          avatarUrl == other.avatarUrl;

  @override
  int get hashCode => Object.hash(
    id,
    fullName,
    age,
    professionTitle,
    serviceCategoryId,
    area,
    yearsOfExperience,
    rating,
    completedJobs,
    distanceInKm,
    priceDescription,
    shortBio,
    avatarUrl,
  );
}
