import 'package:alo_tho/core/utils/copy_with.dart';

class User {
  const User({
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

  User copyWith({
    String? id,
    String? fullName,
    String? phoneNumber,
    String? city,
    bool? isWorker,
    Object? avatarUrl = copyWithUnchanged,
    DateTime? joinedAt,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      city: city ?? this.city,
      isWorker: isWorker ?? this.isWorker,
      avatarUrl: copyWithNullable<String>(avatarUrl, this.avatarUrl),
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          id == other.id &&
          fullName == other.fullName &&
          phoneNumber == other.phoneNumber &&
          city == other.city &&
          isWorker == other.isWorker &&
          avatarUrl == other.avatarUrl &&
          joinedAt == other.joinedAt;

  @override
  int get hashCode => Object.hash(
    id,
    fullName,
    phoneNumber,
    city,
    isWorker,
    avatarUrl,
    joinedAt,
  );
}
