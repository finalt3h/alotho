import 'package:alo_tho/features/chat/domain/entities/chat_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_conversation_detail.freezed.dart';

@freezed
class ChatConversationDetail with _$ChatConversationDetail {
  const factory ChatConversationDetail({
    required String conversationId,
    required String workerId,
    required String workerName,
    required String workerAvatarUrl,
    required String professionTitle,
    required bool isWorkerOnline,
    required DateTime lastActiveAt,
    @Default([]) List<ChatMessage> messages,
  }) = _ChatConversationDetail;
}
