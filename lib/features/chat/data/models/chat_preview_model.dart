import 'package:alo_tho/core/utils/json_readers.dart';
import 'package:alo_tho/features/chat/domain/entities/chat_preview.dart';

class ChatPreviewModel {
  const ChatPreviewModel({
    required this.id,
    required this.conversationId,
    required this.workerId,
    required this.workerName,
    required this.workerAvatarUrl,
    required this.professionTitle,
    required this.lastMessage,
    required this.updatedAt,
    required this.isRead,
    required this.unreadCount,
  });

  final String id;
  final String conversationId;
  final String workerId;
  final String workerName;
  final String workerAvatarUrl;
  final String professionTitle;
  final String lastMessage;
  final DateTime updatedAt;
  final bool isRead;
  final int unreadCount;

  factory ChatPreviewModel.fromJson(Map<String, dynamic> json) =>
      ChatPreviewModel(
        id: readString(json, 'id'),
        conversationId: readString(json, 'conversationId'),
        workerId: readString(json, 'workerId'),
        workerName: readString(json, 'workerName'),
        workerAvatarUrl: readString(json, 'workerAvatarUrl'),
        professionTitle: readString(json, 'professionTitle'),
        lastMessage: readString(json, 'lastMessage'),
        updatedAt: readDateTime(json, 'updatedAt'),
        isRead: readBool(json, 'isRead'),
        unreadCount: readInt(json, 'unreadCount'),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'conversationId': conversationId,
    'workerId': workerId,
    'workerName': workerName,
    'workerAvatarUrl': workerAvatarUrl,
    'professionTitle': professionTitle,
    'lastMessage': lastMessage,
    'updatedAt': updatedAt.toIso8601String(),
    'isRead': isRead,
    'unreadCount': unreadCount,
  };

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
