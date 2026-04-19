import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/chat/domain/entities/chat_conversation_detail.dart';
import 'package:alo_tho/features/chat/domain/entities/chat_preview.dart';

abstract interface class ChatRepository {
  Future<Result<List<ChatPreview>>> getChatPreviews();

  Future<Result<ChatConversationDetail>> getConversationDetail(
    String conversationId,
  );
}
