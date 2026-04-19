// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_conversation_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatConversationDetailModelImpl _$$ChatConversationDetailModelImplFromJson(
  Map<String, dynamic> json,
) => _$ChatConversationDetailModelImpl(
  conversationId: json['conversationId'] as String,
  workerId: json['workerId'] as String,
  workerName: json['workerName'] as String,
  workerAvatarUrl: json['workerAvatarUrl'] as String,
  professionTitle: json['professionTitle'] as String,
  isWorkerOnline: json['isWorkerOnline'] as bool,
  lastActiveAt: DateTime.parse(json['lastActiveAt'] as String),
  messages:
      (json['messages'] as List<dynamic>?)
          ?.map((e) => ChatMessageModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ChatConversationDetailModelImplToJson(
  _$ChatConversationDetailModelImpl instance,
) => <String, dynamic>{
  'conversationId': instance.conversationId,
  'workerId': instance.workerId,
  'workerName': instance.workerName,
  'workerAvatarUrl': instance.workerAvatarUrl,
  'professionTitle': instance.professionTitle,
  'isWorkerOnline': instance.isWorkerOnline,
  'lastActiveAt': instance.lastActiveAt.toIso8601String(),
  'messages': instance.messages,
};
