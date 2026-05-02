import 'package:alo_tho/core/utils/copy_with.dart';

enum ChatMessageDeliveryStatus { sending, sent, read, failed }

class ChatMessage {
  const ChatMessage({
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

  bool get hasText => text?.trim().isNotEmpty ?? false;
  bool get hasImage => imageAssetPath?.trim().isNotEmpty ?? false;

  ChatMessage copyWith({
    String? id,
    String? conversationId,
    bool? isFromCurrentUser,
    Object? text = copyWithUnchanged,
    Object? imageAssetPath = copyWithUnchanged,
    DateTime? createdAt,
    ChatMessageDeliveryStatus? deliveryStatus,
    int? retryCount,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      conversationId: conversationId ?? this.conversationId,
      isFromCurrentUser: isFromCurrentUser ?? this.isFromCurrentUser,
      text: copyWithNullable<String>(text, this.text),
      imageAssetPath: copyWithNullable<String>(
        imageAssetPath,
        this.imageAssetPath,
      ),
      createdAt: createdAt ?? this.createdAt,
      deliveryStatus: deliveryStatus ?? this.deliveryStatus,
      retryCount: retryCount ?? this.retryCount,
    );
  }
}
