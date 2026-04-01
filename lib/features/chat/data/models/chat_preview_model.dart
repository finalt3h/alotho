import 'package:alo_tho/features/chat/domain/entities/chat_preview.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_preview_model.freezed.dart';
part 'chat_preview_model.g.dart';

@freezed
class ChatPreviewModel with _$ChatPreviewModel {
  const ChatPreviewModel._();

  const factory ChatPreviewModel({
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
  }) = _ChatPreviewModel;

  factory ChatPreviewModel.fromJson(Map<String, dynamic> json) =>
      _$ChatPreviewModelFromJson(json);

  ChatPreview toEntity() => ChatPreview(
    id: id,
    conversationId: conversationId,
    workerId: workerId,
    workerName: workerName,
    workerAvatarUrl: workerAvatarUrl,
    professionTitle: professionTitle,
    lastMessage: lastMessage,
    updatedAt: updatedAt,
    isRead: isRead,
    unreadCount: unreadCount,
  );
}
