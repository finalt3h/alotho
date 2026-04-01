import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_preview.freezed.dart';

@freezed
class ChatPreview with _$ChatPreview {
  const factory ChatPreview({
    required String id,
    required String conversationId,
    required String workerId,
    required String workerName,
    required String workerAvatarUrl,
    required String professionTitle,
    required String lastMessage,
    required DateTime updatedAt,
    required bool isRead,
    required int unreadCount,
  }) = _ChatPreview;
}
