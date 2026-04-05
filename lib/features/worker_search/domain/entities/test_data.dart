import 'package:freezed_annotation/freezed_annotation.dart';
part 'test_data.freezed.dart';
@freezed
class TestData with _$TestData {
  const factory TestData({
    required String id,
    required String fullName,
    required int age,
    required String professionTitle,
    required String serviceCategoryId,
    required int completedJobs,
    required double distanceInKm,
    required String priceDescription,
    required String shortBio,
    String? avatarUrl,
  }) = _TestData;
}