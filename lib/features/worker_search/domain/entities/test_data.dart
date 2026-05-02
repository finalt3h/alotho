import 'package:alo_tho/core/utils/copy_with.dart';

class TestData {
  const TestData({
    required this.id,
    required this.fullName,
    required this.age,
    required this.professionTitle,
    required this.serviceCategoryId,
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
  final int completedJobs;
  final double distanceInKm;
  final String priceDescription;
  final String shortBio;
  final String? avatarUrl;

  TestData copyWith({
    String? id,
    String? fullName,
    int? age,
    String? professionTitle,
    String? serviceCategoryId,
    int? completedJobs,
    double? distanceInKm,
    String? priceDescription,
    String? shortBio,
    Object? avatarUrl = copyWithUnchanged,
  }) {
    return TestData(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      age: age ?? this.age,
      professionTitle: professionTitle ?? this.professionTitle,
      serviceCategoryId: serviceCategoryId ?? this.serviceCategoryId,
      completedJobs: completedJobs ?? this.completedJobs,
      distanceInKm: distanceInKm ?? this.distanceInKm,
      priceDescription: priceDescription ?? this.priceDescription,
      shortBio: shortBio ?? this.shortBio,
      avatarUrl: copyWithNullable<String>(avatarUrl, this.avatarUrl),
    );
  }
}
