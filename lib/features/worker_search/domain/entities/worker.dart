import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker.freezed.dart';

@freezed
class Worker with _$Worker {
  const factory Worker({
    required String id,
    required String fullName,
    required int age,
    required String professionTitle,
    required String serviceCategoryId,
    required String area,
    required int yearsOfExperience,
    required double rating,
    required int completedJobs,
    required double distanceInKm,
    required String priceDescription,
    required String shortBio,
    String? avatarUrl,
  }) = _Worker;
}
