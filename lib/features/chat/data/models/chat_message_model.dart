import 'package:alo_tho/core/utils/json_readers.dart';
import 'package:alo_tho/features/chat/domain/entities/chat_message.dart';

class ChatMessageModel {
  const ChatMessageModel({
    required this.id,
    required this.conversationId,
    required this.isFromCurrentUser,
    this.text,
    this.imageAssetPath,
    required this.createdAt,
    this.deliveryStatus = ChatMessageDeliveryStatus.read,
    this.retryCount = 0,
  });

  final String id;
  final String conversationId;
  final bool isFromCurrentUser;
  final String? text;
  final String? imageAssetPath;
  final DateTime createdAt;
  final ChatMessageDeliveryStatus deliveryStatus;
  final int retryCount;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      ChatMessageModel(
        id: readString(json, 'id'),
        conversationId: readString(json, 'conversationId'),
        isFromCurrentUser: readBool(json, 'isFromCurrentUser'),
        text: json['text'] as String?,
        imageAssetPath: json['imageAssetPath'] as String?,
        createdAt: readDateTime(json, 'createdAt'),
        deliveryStatus: readEnum(
          ChatMessageDeliveryStatus.values,
          json['deliveryStatus'],
          ChatMessageDeliveryStatus.read,
        ),
        retryCount: readInt(json, 'retryCount'),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'conversationId': conversationId,
    'isFromCurrentUser': isFromCurrentUser,
    'text': text,
    'imageAssetPath': imageAssetPath,
    'createdAt': createdAt.toIso8601String(),
    'deliveryStatus': deliveryStatus.name,
    'retryCount': retryCount,
  };

  ChatMessage toEntity() => ChatMessage(
    id: id,
    conversationId: conversationId,
    isFromCurrentUser: isFromCurrentUser,
    text: text,
    imageAssetPath: imageAssetPath,
    createdAt: createdAt,
    deliveryStatus: deliveryStatus,
    retryCount: retryCount,
  );
}
