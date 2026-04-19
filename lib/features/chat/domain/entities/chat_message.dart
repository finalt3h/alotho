import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';

enum ChatMessageDeliveryStatus { sending, sent, read, failed }

@freezed
class ChatMessage with _$ChatMessage {
  const ChatMessage._();

  const factory ChatMessage({
    required String id,
    required String conversationId,
    required bool isFromCurrentUser,
    String? text,
    String? imageAssetPath,
    required DateTime createdAt,
    @Default(ChatMessageDeliveryStatus.read)
    ChatMessageDeliveryStatus deliveryStatus,
    @Default(0) int retryCount,
  }) = _ChatMessage;

  bool get hasText => text?.trim().isNotEmpty ?? false;
  bool get hasImage => imageAssetPath?.trim().isNotEmpty ?? false;
}
