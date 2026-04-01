// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileSummaryModelImpl _$$ProfileSummaryModelImplFromJson(
  Map<String, dynamic> json,
) => _$ProfileSummaryModelImpl(
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
  workerProfile: json['workerProfile'] == null
      ? null
      : WorkerModel.fromJson(json['workerProfile'] as Map<String, dynamic>),
  isKycSubmitted: json['isKycSubmitted'] as bool,
  isKycApproved: json['isKycApproved'] as bool,
);

Map<String, dynamic> _$$ProfileSummaryModelImplToJson(
  _$ProfileSummaryModelImpl instance,
) => <String, dynamic>{
  'user': instance.user,
  'workerProfile': instance.workerProfile,
  'isKycSubmitted': instance.isKycSubmitted,
  'isKycApproved': instance.isKycApproved,
};
