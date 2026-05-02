import 'package:alo_tho/core/utils/json_readers.dart';
import 'package:alo_tho/features/chat/data/models/chat_message_model.dart';
import 'package:alo_tho/features/chat/domain/entities/chat_conversation_detail.dart';

class ChatConversationDetailModel {
  const ChatConversationDetailModel({
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
  final List<ChatMessageModel> messages;

  factory ChatConversationDetailModel.fromJson(Map<String, dynamic> json) {
    final rawMessages = json['messages'];
    return ChatConversationDetailModel(
      conversationId: readString(json, 'conversationId'),
      workerId: readString(json, 'workerId'),
      workerName: readString(json, 'workerName'),
      workerAvatarUrl: readString(json, 'workerAvatarUrl'),
      professionTitle: readString(json, 'professionTitle'),
      isWorkerOnline: readBool(json, 'isWorkerOnline'),
      lastActiveAt: readDateTime(json, 'lastActiveAt'),
      messages: rawMessages is List
          ? rawMessages
                .whereType<Map<String, dynamic>>()
                .map(ChatMessageModel.fromJson)
                .toList()
          : const [],
    );
  }

  Map<String, dynamic> toJson() => {
    'conversationId': conversationId,
    'workerId': workerId,
    'workerName': workerName,
    'workerAvatarUrl': workerAvatarUrl,
    'professionTitle': professionTitle,
    'isWorkerOnline': isWorkerOnline,
    'lastActiveAt': lastActiveAt.toIso8601String(),
    'messages': messages.map((item) => item.toJson()).toList(),
  };

  ChatConversationDetail toEntity() => ChatConversationDetail(
    conversationId: conversationId,
    workerId: workerId,
    workerName: workerName,
    workerAvatarUrl: workerAvatarUrl,
    professionTitle: professionTitle,
    isWorkerOnline: isWorkerOnline,
    lastActiveAt: lastActiveAt,
    messages: messages.map((item) => item.toEntity()).toList(),
  );
}
