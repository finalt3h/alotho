import 'package:alo_tho/features/auth/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String fullName,
    required String phoneNumber,
    required String city,
    required bool isWorker,
    String? avatarUrl,
    required DateTime joinedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  User toEntity() => User(
    id: id,
    fullName: fullName,
    phoneNumber: phoneNumber,
    city: city,
    isWorker: isWorker,
    avatarUrl: avatarUrl,
    joinedAt: joinedAt,
  );

  factory UserModel.fromEntity(User entity) => UserModel(
    id: entity.id,
    fullName: entity.fullName,
    phoneNumber: entity.phoneNumber,
    city: entity.city,
    isWorker: entity.isWorker,
    avatarUrl: entity.avatarUrl,
    joinedAt: entity.joinedAt,
  );
}
