import 'package:alo_tho/features/chat/domain/entities/chat_conversation_detail.dart';
import 'package:alo_tho/features/chat/domain/entities/chat_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_detail_state.freezed.dart';

@freezed
class ChatDetailState with _$ChatDetailState {
  const factory ChatDetailState({
    @Default(true) bool isLoading,
    String? errorMessage,
    ChatConversationDetail? conversation,
    @Default([]) List<ChatMessage> messages,
    @Default(false) bool isWorkerTyping,
    String? composerImageAssetPath,
    @Default([]) List<String> availableImageAssets,
  }) = _ChatDetailState;
}
