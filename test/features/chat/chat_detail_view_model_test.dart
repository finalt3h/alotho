import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/chat/data/repositories/mock_chat_repository.dart';
import 'package:alo_tho/features/chat/domain/entities/chat_conversation_detail.dart';
import 'package:alo_tho/features/chat/domain/entities/chat_message.dart';
import 'package:alo_tho/features/chat/domain/entities/chat_preview.dart';
import 'package:alo_tho/features/chat/domain/repositories/chat_repository.dart';
import 'package:alo_tho/features/chat/presentation/viewmodels/chat_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ChatDetailController', () {
    test('loads conversation detail', () async {
      final container = ProviderContainer(
        overrides: [
          chatRepositoryProvider.overrideWithValue(_FakeChatRepository()),
        ],
      );
      addTearDown(container.dispose);

      final provider = chatDetailControllerProvider('conversation-001');
      final notifier = container.read(provider.notifier);
      await notifier.load();

      final state = container.read(provider);

      expect(state.isLoading, isFalse);
      expect(state.conversation?.workerName, 'Le Van Khoa');
      expect(state.messages.length, 2);
    });

    test('sends text with image and marks as read after auto reply', () async {
      final container = ProviderContainer(
        overrides: [
          chatRepositoryProvider.overrideWithValue(_FakeChatRepository()),
        ],
      );
      addTearDown(container.dispose);

      final provider = chatDetailControllerProvider('conversation-001');
      final notifier = container.read(provider.notifier);
      await notifier.load();

      notifier.attachImage('assets/worker_detail/portfolio_1.png');
      await notifier.sendMessage(text: 'Em gui them thong tin');

      final state = container.read(provider);
      final sentMessage = state.messages.firstWhere(
        (item) => item.isFromCurrentUser && item.imageAssetPath != null,
      );

      expect(
        sentMessage.imageAssetPath,
        'assets/worker_detail/portfolio_1.png',
      );
      expect(sentMessage.deliveryStatus, ChatMessageDeliveryStatus.read);
      expect(state.messages.last.isFromCurrentUser, isFalse);
      expect(state.isWorkerTyping, isFalse);
    });

    test('can retry when sending failed', () async {
      final container = ProviderContainer(
        overrides: [
          chatRepositoryProvider.overrideWithValue(_FakeChatRepository()),
        ],
      );
      addTearDown(container.dispose);

      final provider = chatDetailControllerProvider('conversation-001');
      final notifier = container.read(provider.notifier);
      await notifier.load();

      await notifier.sendMessage(text: 'Tin nhan loi', forceFail: true);
      var state = container.read(provider);

      final failedMessage = state.messages.firstWhere(
        (item) =>
            item.isFromCurrentUser &&
            item.deliveryStatus == ChatMessageDeliveryStatus.failed,
      );

      await notifier.retryMessage(failedMessage.id);
      state = container.read(provider);

      final retriedMessage = state.messages.firstWhere(
        (item) => item.id == failedMessage.id,
      );

      expect(
        retriedMessage.deliveryStatus,
        anyOf(ChatMessageDeliveryStatus.sent, ChatMessageDeliveryStatus.read),
      );
    });
  });
}

class _FakeChatRepository implements ChatRepository {
  @override
  Future<Result<ChatConversationDetail>> getConversationDetail(
    String conversationId,
  ) async {
    return Success(
      ChatConversationDetail(
        conversationId: conversationId,
        workerId: 'worker-001',
        workerName: 'Le Van Khoa',
        workerAvatarUrl: 'https://i.pravatar.cc/160?img=12',
        professionTitle: 'Tho dien dan dung',
        isWorkerOnline: true,
        lastActiveAt: DateTime(2026, 4, 19, 9, 30),
        messages: [
          ChatMessage(
            id: 'seed-001',
            conversationId: conversationId,
            isFromCurrentUser: false,
            text: 'Chao anh, em da xem qua mo ta su co roi.',
            createdAt: DateTime(2026, 4, 19, 9, 10),
          ),
          ChatMessage(
            id: 'seed-002',
            conversationId: conversationId,
            isFromCurrentUser: true,
            text: 'Anh nghi aptomat bi nhay lien tuc, em xem giup nhe.',
            createdAt: DateTime(2026, 4, 19, 9, 11),
            deliveryStatus: ChatMessageDeliveryStatus.read,
          ),
        ],
      ),
    );
  }

  @override
  Future<Result<List<ChatPreview>>> getChatPreviews() async {
    return Success([
      ChatPreview(
        id: 'preview-001',
        conversationId: 'conversation-001',
        workerId: 'worker-001',
        workerName: 'Le Van Khoa',
        workerAvatarUrl: 'https://i.pravatar.cc/160?img=12',
        professionTitle: 'Tho dien dan dung',
        lastMessage: 'Em co the qua kiem tra o cam cho minh luc 19:00.',
        updatedAt: DateTime(2026, 4, 19, 9, 15),
        isRead: true,
        unreadCount: 0,
      ),
    ]);
  }
}
