import 'package:alo_tho/features/chat/domain/entities/chat_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';

@freezed
class ChatMessageModel with _$ChatMessageModel {
  const ChatMessageModel._();

  const factory ChatMessageModel({
    required String id,
    required String conversationId,
    required bool isFromCurrentUser,
    String? text,
    String? imageAssetPath,
    required DateTime createdAt,
    @Default(ChatMessageDeliveryStatus.read)
    ChatMessageDeliveryStatus deliveryStatus,
    @Default(0) int retryCount,
  }) = _ChatMessageModel;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);

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
