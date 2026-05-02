import 'package:alo_tho/core/utils/copy_with.dart';
import 'package:alo_tho/features/chat/domain/entities/chat_conversation_detail.dart';
import 'package:alo_tho/features/chat/domain/entities/chat_message.dart';

class ChatDetailState {
  const ChatDetailState({
    this.isLoading = true,
    this.errorMessage,
    this.conversation,
    this.messages = const [],
    this.isWorkerTyping = false,
    this.composerImageAssetPath,
    this.availableImageAssets = const [],
  });

  final bool isLoading;
  final String? errorMessage;
  final ChatConversationDetail? conversation;
  final List<ChatMessage> messages;
  final bool isWorkerTyping;
  final String? composerImageAssetPath;
  final List<String> availableImageAssets;

  ChatDetailState copyWith({
    bool? isLoading,
    Object? errorMessage = copyWithUnchanged,
    Object? conversation = copyWithUnchanged,
    List<ChatMessage>? messages,
    bool? isWorkerTyping,
    Object? composerImageAssetPath = copyWithUnchanged,
    List<String>? availableImageAssets,
  }) {
    return ChatDetailState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: copyWithNullable<String>(errorMessage, this.errorMessage),
      conversation: copyWithNullable<ChatConversationDetail>(
        conversation,
        this.conversation,
      ),
      messages: messages ?? this.messages,
      isWorkerTyping: isWorkerTyping ?? this.isWorkerTyping,
      composerImageAssetPath: copyWithNullable<String>(
        composerImageAssetPath,
        this.composerImageAssetPath,
      ),
      availableImageAssets: availableImageAssets ?? this.availableImageAssets,
    );
  }
}
