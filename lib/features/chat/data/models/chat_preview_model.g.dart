// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_preview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatPreviewModelImpl _$$ChatPreviewModelImplFromJson(
  Map<String, dynamic> json,
) => _$ChatPreviewModelImpl(
  id: json['id'] as String,
  conversationId: json['conversationId'] as String,
  workerId: json['workerId'] as String,
  workerName: json['workerName'] as String,
  workerAvatarUrl: json['workerAvatarUrl'] as String,
  professionTitle: json['professionTitle'] as String,
  lastMessage: json['lastMessage'] as String,
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  isRead: json['isRead'] as bool,
  unreadCount: (json['unreadCount'] as num).toInt(),
);

Map<String, dynamic> _$$ChatPreviewModelImplToJson(
  _$ChatPreviewModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'conversationId': instance.conversationId,
  'workerId': instance.workerId,
  'workerName': instance.workerName,
  'workerAvatarUrl': instance.workerAvatarUrl,
  'professionTitle': instance.professionTitle,
  'lastMessage': instance.lastMessage,
  'updatedAt': instance.updatedAt.toIso8601String(),
  'isRead': instance.isRead,
  'unreadCount': instance.unreadCount,
};
