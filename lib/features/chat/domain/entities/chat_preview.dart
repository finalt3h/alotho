class ChatPreview {
  const ChatPreview({
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

  ChatPreview copyWith({
    String? id,
    String? conversationId,
    String? workerId,
    String? workerName,
    String? workerAvatarUrl,
    String? professionTitle,
    String? lastMessage,
    DateTime? updatedAt,
    bool? isRead,
    int? unreadCount,
  }) {
    return ChatPreview(
      id: id ?? this.id,
      conversationId: conversationId ?? this.conversationId,
      workerId: workerId ?? this.workerId,
      workerName: workerName ?? this.workerName,
      workerAvatarUrl: workerAvatarUrl ?? this.workerAvatarUrl,
      professionTitle: professionTitle ?? this.professionTitle,
      lastMessage: lastMessage ?? this.lastMessage,
      updatedAt: updatedAt ?? this.updatedAt,
      isRead: isRead ?? this.isRead,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }
}
