import 'package:alo_tho/features/auth/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

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

  factory UserModel.fromSupabaseUser(supabase.User authUser) {
    final metadata = authUser.userMetadata ?? <String, dynamic>{};
    final fullName =
        (metadata['full_name'] as String?)?.trim().isNotEmpty == true
        ? (metadata['full_name'] as String).trim()
        : (metadata['name'] as String?)?.trim().isNotEmpty == true
        ? (metadata['name'] as String).trim()
        : _fallbackName(authUser);

    final phoneNumber =
        (metadata['phone_number'] as String?)?.trim().isNotEmpty == true
        ? (metadata['phone_number'] as String).trim()
        : (authUser.phone ?? '').trim();

    final city = (metadata['city'] as String?)?.trim().isNotEmpty == true
        ? (metadata['city'] as String).trim()
        : 'Chua cap nhat';

    return UserModel(
      id: authUser.id,
      fullName: fullName,
      phoneNumber: phoneNumber,
      city: city,
      isWorker: _parseIsWorker(metadata['is_worker']),
      avatarUrl: (metadata['avatar_url'] as String?)?.trim(),
      joinedAt: DateTime.tryParse(authUser.createdAt) ?? DateTime.now(),
    );
  }

  static String _fallbackName(supabase.User authUser) {
    final email = authUser.email?.trim();
    if (email != null && email.isNotEmpty) {
      return email.split('@').first;
    }

    final phone = authUser.phone?.trim();
    if (phone != null && phone.isNotEmpty) {
      return phone;
    }

    return 'Nguoi dung';
  }

  static bool _parseIsWorker(Object? value) {
    return switch (value) {
      final bool boolValue => boolValue,
      final String stringValue => stringValue.toLowerCase() == 'true',
      final num numericValue => numericValue != 0,
      _ => false,
    };
  }
}
