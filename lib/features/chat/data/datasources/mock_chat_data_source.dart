import 'package:alo_tho/features/chat/data/models/chat_conversation_detail_model.dart';
import 'package:alo_tho/features/chat/data/models/chat_message_model.dart';
import 'package:alo_tho/features/chat/data/models/chat_preview_model.dart';
import 'package:alo_tho/features/chat/domain/entities/chat_message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatDataSourceProvider = Provider<MockChatDataSource>(
  (ref) => const MockChatDataSource(),
);

class MockChatDataSource {
  const MockChatDataSource();

  Future<List<ChatPreviewModel>> getChatPreviews() async {
    await Future<void>.delayed(const Duration(milliseconds: 320));

    return [
      ChatPreviewModel(
        id: 'preview-001',
        conversationId: 'conversation-001',
        workerId: 'worker-001',
        workerName: 'Le Van Khoa',
        workerAvatarUrl: 'https://i.pravatar.cc/160?img=12',
        professionTitle: 'Tho dien dan dung',
        lastMessage: 'Em co the qua kiem tra o cam cho minh luc 19:00.',
        updatedAt: DateTime.now().subtract(const Duration(minutes: 18)),
        isRead: false,
        unreadCount: 2,
      ),
      ChatPreviewModel(
        id: 'preview-002',
        conversationId: 'conversation-002',
        workerId: 'worker-003',
        workerName: 'Do Duc Hai',
        workerAvatarUrl: 'https://i.pravatar.cc/160?img=53',
        professionTitle: 'Tho dien lanh',
        lastMessage: 'Anh da gui bao gia va thoi gian qua nha ngay mai.',
        updatedAt: DateTime.now().subtract(const Duration(hours: 3)),
        isRead: true,
        unreadCount: 0,
      ),
      ChatPreviewModel(
        id: 'preview-003',
        conversationId: 'conversation-003',
        workerId: 'worker-002',
        workerName: 'Pham Quoc Bao',
        workerAvatarUrl: 'https://i.pravatar.cc/160?img=15',
        professionTitle: 'Tho nuoc nhanh gon',
        lastMessage: 'Minh chup them hien trang duong ong giup em nhe.',
        updatedAt: DateTime.now().subtract(const Duration(days: 1, hours: 1)),
        isRead: false,
        unreadCount: 1,
      ),
      ChatPreviewModel(
        id: 'preview-004',
        conversationId: 'conversation-004',
        workerId: 'worker-006',
        workerName: 'Tran Huu Dat',
        workerAvatarUrl: 'https://i.pravatar.cc/160?img=60',
        professionTitle: 'Tho ong nuoc am tuong',
        lastMessage:
            'Phan ro ngam nay em can ghé do ap luc nuoc trước khi bao gia.',
        updatedAt: DateTime.now().subtract(
          const Duration(hours: 6, minutes: 20),
        ),
        isRead: true,
        unreadCount: 0,
      ),
      ChatPreviewModel(
        id: 'preview-005',
        conversationId: 'conversation-005',
        workerId: 'worker-004',
        workerName: 'Nguyen Anh Tuan',
        workerAvatarUrl: 'https://i.pravatar.cc/160?img=28',
        professionTitle: 'Tho do gia dung',
        lastMessage:
            'Chieu nay em co slot 16:30, minh xac nhan de em mang dung linh kien.',
        updatedAt: DateTime.now().subtract(const Duration(days: 2, hours: 4)),
        isRead: false,
        unreadCount: 3,
      ),
    ];
  }

  Future<ChatConversationDetailModel> getConversationDetail(
    String conversationId,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 360));

    final previews = await getChatPreviews();
    final preview = previews.firstWhere(
      (item) => item.conversationId == conversationId,
      orElse: () => throw StateError('conversation not found'),
    );

    return ChatConversationDetailModel(
      conversationId: preview.conversationId,
      workerId: preview.workerId,
      workerName: preview.workerName,
      workerAvatarUrl: preview.workerAvatarUrl,
      professionTitle: preview.professionTitle,
      isWorkerOnline: conversationId == 'conversation-001',
      lastActiveAt: DateTime.now().subtract(const Duration(minutes: 3)),
      messages: _messagesForConversation(conversationId),
    );
  }

  List<ChatMessageModel> _messagesForConversation(String conversationId) {
    final now = DateTime.now();

    return switch (conversationId) {
      'conversation-001' => [
        ChatMessageModel(
          id: 'message-001',
          conversationId: conversationId,
          isFromCurrentUser: false,
          text: 'Chao anh, em da xem qua mo ta su co roi.',
          createdAt: now.subtract(const Duration(minutes: 36)),
        ),
        ChatMessageModel(
          id: 'message-002',
          conversationId: conversationId,
          isFromCurrentUser: true,
          text: 'Anh nghi aptomat bi nhay lien tuc, em xem giup nhe.',
          createdAt: now.subtract(const Duration(minutes: 33)),
          deliveryStatus: ChatMessageDeliveryStatus.read,
        ),
        ChatMessageModel(
          id: 'message-003',
          conversationId: conversationId,
          isFromCurrentUser: false,
          text: 'Anh uu tien sua aptomat hay o cam bi chap?',
          createdAt: now.subtract(const Duration(minutes: 29)),
        ),
        ChatMessageModel(
          id: 'message-004',
          conversationId: conversationId,
          isFromCurrentUser: true,
          text: 'Day la hinh aptomat hien tai nha anh.',
          imageAssetPath: 'assets/worker_detail/portfolio_1.png',
          createdAt: now.subtract(const Duration(minutes: 22)),
          deliveryStatus: ChatMessageDeliveryStatus.read,
        ),
        ChatMessageModel(
          id: 'message-005',
          conversationId: conversationId,
          isFromCurrentUser: false,
          text: 'Em co the qua kiem tra o cam cho minh luc 19:00.',
          createdAt: now.subtract(const Duration(minutes: 18)),
        ),
      ],
      'conversation-002' => [
        ChatMessageModel(
          id: 'message-021',
          conversationId: conversationId,
          isFromCurrentUser: false,
          text: 'Anh da gui bao gia va thoi gian qua nha ngay mai.',
          createdAt: now.subtract(const Duration(hours: 3)),
        ),
      ],
      'conversation-003' => [
        ChatMessageModel(
          id: 'message-031',
          conversationId: conversationId,
          isFromCurrentUser: false,
          text: 'Minh chup them hien trang duong ong giup em nhe.',
          createdAt: now.subtract(const Duration(days: 1, hours: 1)),
        ),
      ],
      'conversation-004' => [
        ChatMessageModel(
          id: 'message-041',
          conversationId: conversationId,
          isFromCurrentUser: false,
          text: 'Phan ro ngam nay em can ghé do ap luc nuoc trước khi bao gia.',
          createdAt: now.subtract(const Duration(hours: 6, minutes: 20)),
        ),
      ],
      'conversation-005' => [
        ChatMessageModel(
          id: 'message-051',
          conversationId: conversationId,
          isFromCurrentUser: false,
          text:
              'Chieu nay em co slot 16:30, minh xac nhan de em mang dung linh kien.',
          createdAt: now.subtract(const Duration(days: 2, hours: 4)),
        ),
      ],
      _ => [],
    };
  }
}
