import 'package:alo_tho/features/chat/data/repositories/mock_chat_repository.dart';
import 'package:alo_tho/features/chat/domain/entities/chat_message.dart';
import 'package:alo_tho/features/chat/presentation/viewmodels/chat_detail_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatDetailControllerProvider =
    NotifierProvider.family<ChatDetailController, ChatDetailState, String>(
      ChatDetailController.new,
    );

class ChatDetailController extends FamilyNotifier<ChatDetailState, String> {
  static const _sendDelay = Duration(milliseconds: 550);
  static const _retryDelay = Duration(milliseconds: 500);
  static const _typingDelay = Duration(milliseconds: 900);
  static const _availableImageAssets = <String>[
    'assets/worker_detail/portfolio_1.png',
    'assets/worker_detail/portfolio_2.png',
    'assets/worker_detail/portfolio_3.png',
    'assets/worker_detail/portfolio_4.png',
  ];
  static const _autoReplies = <String>[
    'Em da nhan thong tin. Em dang kiem tra lich va phan hoi ngay.',
    'Ok anh, em da xem anh gui. Em se cap nhat trong it phut.',
    'Da nhan anh nhe. Em sap xep tho den som nhat co the.',
  ];

  bool _didBootstrap = false;
  bool _isLoadingConversation = false;
  int _outgoingSequence = 0;
  int _autoReplyCursor = 0;

  @override
  ChatDetailState build(String arg) {
    if (!_didBootstrap) {
      _didBootstrap = true;
      Future<void>.microtask(load);
    }

    return const ChatDetailState(availableImageAssets: _availableImageAssets);
  }

  Future<void> load() async {
    if (_isLoadingConversation) {
      return;
    }
    _isLoadingConversation = true;

    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      availableImageAssets: _availableImageAssets,
    );

    try {
      final result = await ref
          .read(chatRepositoryProvider)
          .getConversationDetail(arg);

      state = result.when(
        success: (conversation) {
          final messages = [...conversation.messages]
            ..sort((left, right) => left.createdAt.compareTo(right.createdAt));
          return state.copyWith(
            isLoading: false,
            conversation: conversation.copyWith(messages: messages),
            messages: messages,
            isWorkerTyping: false,
            composerImageAssetPath: null,
            availableImageAssets: _availableImageAssets,
          );
        },
        failure: (failure) => state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
          isWorkerTyping: false,
        ),
      );
    } finally {
      _isLoadingConversation = false;
    }
  }

  void attachImage(String assetPath) {
    if (!state.availableImageAssets.contains(assetPath)) {
      return;
    }

    state = state.copyWith(composerImageAssetPath: assetPath);
  }

  void removeAttachedImage() {
    state = state.copyWith(composerImageAssetPath: null);
  }

  Future<void> sendMessage({
    required String text,
    @visibleForTesting bool forceFail = false,
  }) async {
    final conversation = state.conversation;
    if (conversation == null) {
      return;
    }

    final trimmedText = text.trim();
    final imageAssetPath = state.composerImageAssetPath;
    if (trimmedText.isEmpty && imageAssetPath == null) {
      return;
    }

    _outgoingSequence += 1;
    final messageId = 'message-local-${DateTime.now().microsecondsSinceEpoch}';
    final optimisticMessage = ChatMessage(
      id: messageId,
      conversationId: arg,
      isFromCurrentUser: true,
      text: trimmedText.isEmpty ? null : trimmedText,
      imageAssetPath: imageAssetPath,
      createdAt: DateTime.now(),
      deliveryStatus: ChatMessageDeliveryStatus.sending,
    );

    _appendMessage(optimisticMessage);
    state = state.copyWith(composerImageAssetPath: null);

    await Future<void>.delayed(_sendDelay);

    if (forceFail || _shouldFailInitialSend(_outgoingSequence)) {
      _replaceMessage(
        messageId,
        (current) =>
            current.copyWith(deliveryStatus: ChatMessageDeliveryStatus.failed),
      );
      return;
    }

    _replaceMessage(
      messageId,
      (current) => current.copyWith(
        deliveryStatus: ChatMessageDeliveryStatus.sent,
        createdAt: DateTime.now(),
      ),
    );

    await _simulateWorkerTypingAndReply(lastOutgoingMessageId: messageId);
  }

  Future<void> retryMessage(String messageId) async {
    final message = _findMessageById(messageId);
    if (message == null ||
        message.deliveryStatus != ChatMessageDeliveryStatus.failed) {
      return;
    }

    _replaceMessage(
      messageId,
      (current) => current.copyWith(
        deliveryStatus: ChatMessageDeliveryStatus.sending,
        retryCount: current.retryCount + 1,
      ),
    );

    await Future<void>.delayed(_retryDelay);

    _replaceMessage(
      messageId,
      (current) => current.copyWith(
        deliveryStatus: ChatMessageDeliveryStatus.sent,
        createdAt: DateTime.now(),
      ),
    );

    await _simulateWorkerTypingAndReply(lastOutgoingMessageId: messageId);
  }

  bool _shouldFailInitialSend(int sequence) {
    return sequence % 4 == 0;
  }

  Future<void> _simulateWorkerTypingAndReply({
    required String lastOutgoingMessageId,
  }) async {
    state = state.copyWith(isWorkerTyping: true);

    await Future<void>.delayed(_typingDelay);

    final now = DateTime.now();
    _replaceMessage(
      lastOutgoingMessageId,
      (current) =>
          current.copyWith(deliveryStatus: ChatMessageDeliveryStatus.read),
    );

    final replyMessage = ChatMessage(
      id: 'message-auto-${now.microsecondsSinceEpoch}',
      conversationId: arg,
      isFromCurrentUser: false,
      text: _nextAutoReply(),
      createdAt: now,
      deliveryStatus: ChatMessageDeliveryStatus.read,
    );

    _appendMessage(replyMessage, isWorkerTyping: false, lastActiveAt: now);
  }

  String _nextAutoReply() {
    final reply = _autoReplies[_autoReplyCursor % _autoReplies.length];
    _autoReplyCursor += 1;
    return reply;
  }

  ChatMessage? _findMessageById(String messageId) {
    for (final message in state.messages) {
      if (message.id == messageId) {
        return message;
      }
    }

    return null;
  }

  void _replaceMessage(
    String messageId,
    ChatMessage Function(ChatMessage current) transform,
  ) {
    final updated = state.messages.map((message) {
      if (message.id != messageId) {
        return message;
      }

      return transform(message);
    }).toList();

    _syncMessages(updated);
  }

  void _appendMessage(
    ChatMessage message, {
    bool? isWorkerTyping,
    DateTime? lastActiveAt,
  }) {
    final updated = [...state.messages, message];
    _syncMessages(
      updated,
      isWorkerTyping: isWorkerTyping,
      lastActiveAt: lastActiveAt,
    );
  }

  void _syncMessages(
    List<ChatMessage> messages, {
    bool? isWorkerTyping,
    DateTime? lastActiveAt,
  }) {
    final sorted = [...messages]
      ..sort((left, right) => left.createdAt.compareTo(right.createdAt));
    final conversation = state.conversation;

    state = state.copyWith(
      messages: sorted,
      isWorkerTyping: isWorkerTyping ?? state.isWorkerTyping,
      conversation: conversation?.copyWith(
        messages: sorted,
        lastActiveAt: lastActiveAt ?? conversation.lastActiveAt,
      ),
    );
  }
}
