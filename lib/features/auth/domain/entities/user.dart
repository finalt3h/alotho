import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String fullName,
    required String phoneNumber,
    required String city,
    required bool isWorker,
    String? avatarUrl,
    required DateTime joinedAt,
  }) = _User;
}
