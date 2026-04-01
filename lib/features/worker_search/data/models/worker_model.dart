import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_model.freezed.dart';
part 'worker_model.g.dart';

@freezed
class WorkerModel with _$WorkerModel {
  const WorkerModel._();

  const factory WorkerModel({
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
  }) = _WorkerModel;

  factory WorkerModel.fromJson(Map<String, dynamic> json) =>
      _$WorkerModelFromJson(json);

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
