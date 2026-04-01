import 'package:alo_tho/features/chat/data/models/chat_preview_model.dart';
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
}
