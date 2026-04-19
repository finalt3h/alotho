// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageModelImpl _$$ChatMessageModelImplFromJson(
  Map<String, dynamic> json,
) => _$ChatMessageModelImpl(
  id: json['id'] as String,
  conversationId: json['conversationId'] as String,
  isFromCurrentUser: json['isFromCurrentUser'] as bool,
  text: json['text'] as String?,
  imageAssetPath: json['imageAssetPath'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  deliveryStatus:
      $enumDecodeNullable(
        _$ChatMessageDeliveryStatusEnumMap,
        json['deliveryStatus'],
      ) ??
      ChatMessageDeliveryStatus.read,
  retryCount: (json['retryCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$ChatMessageModelImplToJson(
  _$ChatMessageModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'conversationId': instance.conversationId,
  'isFromCurrentUser': instance.isFromCurrentUser,
  'text': instance.text,
  'imageAssetPath': instance.imageAssetPath,
  'createdAt': instance.createdAt.toIso8601String(),
  'deliveryStatus':
      _$ChatMessageDeliveryStatusEnumMap[instance.deliveryStatus]!,
  'retryCount': instance.retryCount,
};

const _$ChatMessageDeliveryStatusEnumMap = {
  ChatMessageDeliveryStatus.sending: 'sending',
  ChatMessageDeliveryStatus.sent: 'sent',
  ChatMessageDeliveryStatus.read: 'read',
  ChatMessageDeliveryStatus.failed: 'failed',
};
