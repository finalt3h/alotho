import 'package:alo_tho/core/utils/json_readers.dart';
import 'package:alo_tho/features/auth/domain/entities/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class UserModel {
  const UserModel({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.city,
    required this.isWorker,
    this.avatarUrl,
    required this.joinedAt,
  });

  final String id;
  final String fullName;
  final String phoneNumber;
  final String city;
  final bool isWorker;
  final String? avatarUrl;
  final DateTime joinedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: readString(json, 'id'),
    fullName: readString(json, 'fullName', fallbackKey: 'full_name'),
    phoneNumber: readString(json, 'phoneNumber', fallbackKey: 'phone_number'),
    city: readString(json, 'city'),
    isWorker: readBool(json, 'isWorker'),
    avatarUrl: json['avatarUrl'] as String? ?? json['avatar_url'] as String?,
    joinedAt: readDateTime(json, 'joinedAt'),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'fullName': fullName,
    'phoneNumber': phoneNumber,
    'city': city,
    'isWorker': isWorker,
    'avatarUrl': avatarUrl,
    'joinedAt': joinedAt.toIso8601String(),
  };

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
    if (email != null && email.isNotEmpty) return email.split('@').first;

    final phone = authUser.phone?.trim();
    if (phone != null && phone.isNotEmpty) return phone;

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
