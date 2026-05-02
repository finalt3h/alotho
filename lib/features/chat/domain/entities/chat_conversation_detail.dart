import 'package:alo_tho/features/chat/domain/entities/chat_message.dart';

class ChatConversationDetail {
  const ChatConversationDetail({
    required this.conversationId,
    required this.workerId,
    required this.workerName,
    required this.workerAvatarUrl,
    required this.professionTitle,
    required this.isWorkerOnline,
    required this.lastActiveAt,
    this.messages = const [],
  });

  final String conversationId;
  final String workerId;
  final String workerName;
  final String workerAvatarUrl;
  final String professionTitle;
  final bool isWorkerOnline;
  final DateTime lastActiveAt;
  final List<ChatMessage> messages;

  ChatConversationDetail copyWith({
    String? conversationId,
    String? workerId,
    String? workerName,
    String? workerAvatarUrl,
    String? professionTitle,
    bool? isWorkerOnline,
    DateTime? lastActiveAt,
    List<ChatMessage>? messages,
  }) {
    return ChatConversationDetail(
      conversationId: conversationId ?? this.conversationId,
      workerId: workerId ?? this.workerId,
      workerName: workerName ?? this.workerName,
      workerAvatarUrl: workerAvatarUrl ?? this.workerAvatarUrl,
      professionTitle: professionTitle ?? this.professionTitle,
      isWorkerOnline: isWorkerOnline ?? this.isWorkerOnline,
      lastActiveAt: lastActiveAt ?? this.lastActiveAt,
      messages: messages ?? this.messages,
    );
  }
}
