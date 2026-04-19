import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/preview/app_preview.dart';
import 'package:alo_tho/core/widgets/app_error_view.dart';
import 'package:alo_tho/core/widgets/app_loading_state.dart';
import 'package:alo_tho/core/widgets/app_page_body.dart';
import 'package:alo_tho/core/widgets/avatar_view.dart';
import 'package:alo_tho/features/chat/domain/entities/chat_message.dart';
import 'package:alo_tho/features/chat/presentation/viewmodels/chat_detail_state.dart';
import 'package:alo_tho/features/chat/presentation/viewmodels/chat_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widget_previews.dart';
import 'package:intl/intl.dart';

@Preview(
  group: 'Screens',
  name: 'Chat Detail Page',
  size: phonePreviewSize,
  wrapper: appPreviewWrapper,
)
Widget previewChatDetailPage() =>
    const ChatDetailPage(conversationId: 'conversation-001');

class ChatDetailPage extends ConsumerStatefulWidget {
  const ChatDetailPage({required this.conversationId, super.key});

  final String conversationId;

  @override
  ConsumerState<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends ConsumerState<ChatDetailPage> {
  late final TextEditingController _messageController;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController()..addListener(_onDraftChanged);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _messageController
      ..removeListener(_onDraftChanged)
      ..dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = chatDetailControllerProvider(widget.conversationId);
    final state = ref.watch(provider);
    final controller = ref.read(provider.notifier);
    final conversation = state.conversation;
    final l10n = context.l10n;

    ref.listen(
      provider.select((value) => (value.messages.length, value.isWorkerTyping)),
      (_, _) {
        _scrollToBottom();
      },
    );

    final hasDraftText = _messageController.text.trim().isNotEmpty;
    final canSend = hasDraftText || state.composerImageAssetPath != null;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: _ConversationAppBarTitle(
          workerName: conversation?.workerName,
          workerAvatarUrl: conversation?.workerAvatarUrl,
          professionTitle: conversation?.professionTitle,
          subtitle: state.isWorkerTyping
              ? l10n.messageDetailTyping
              : (conversation?.isWorkerOnline ?? false)
              ? l10n.messageDetailOnline
              : l10n.messageDetailLastSeenAt(
                  DateFormat(
                    'HH:mm',
                  ).format(conversation?.lastActiveAt ?? DateTime.now()),
                ),
        ),
      ),
      body: switch ((state.isLoading, state.errorMessage, conversation)) {
        (true, _, _) => AppPageBody(
          child: AppLoadingState(
            title: l10n.messagesAppBar,
            description: l10n.recentConversationsSubtitle,
          ),
        ),
        (false, final error?, _) => AppPageBody(
          child: AppErrorView(
            message: error,
            onRetry: controller.load,
            title: l10n.messagesAppBar,
          ),
        ),
        _ => Column(
          children: [
            Expanded(
              child: AppPageBody(
                child: ListView.builder(
                  controller: _scrollController,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                  itemCount:
                      state.messages.length + (state.isWorkerTyping ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index >= state.messages.length) {
                      return const Padding(
                        padding: EdgeInsets.only(top: AppSpacing.sm),
                        child: _TypingIndicatorBubble(),
                      );
                    }

                    final message = state.messages[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: _MessageBubble(
                        message: message,
                        onTap:
                            message.deliveryStatus ==
                                ChatMessageDeliveryStatus.failed
                            ? () => controller.retryMessage(message.id)
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
            SafeArea(
              top: false,
              child: AppPageBody(
                child: _ChatComposer(
                  controller: _messageController,
                  selectedImageAssetPath: state.composerImageAssetPath,
                  canSend: canSend,
                  onSendPressed: canSend ? _sendMessage : null,
                  onAttachPressed: () => _showAttachmentSheet(state),
                  onRemoveAttachment: controller.removeAttachedImage,
                ),
              ),
            ),
          ],
        ),
      },
    );
  }

  Future<void> _showAttachmentSheet(ChatDetailState state) async {
    final l10n = context.l10n;
    final provider = chatDetailControllerProvider(widget.conversationId);
    final controller = ref.read(provider.notifier);
    final selectedAssetPath = state.composerImageAssetPath;

    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.messageDetailAttachmentTitle,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  l10n.messageDetailAttachmentHint,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.md),
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: [
                    for (final assetPath in state.availableImageAssets)
                      _AttachmentTile(
                        assetPath: assetPath,
                        isSelected: selectedAssetPath == assetPath,
                        onTap: () {
                          controller.attachImage(assetPath);
                          Navigator.of(sheetContext).pop();
                        },
                      ),
                  ],
                ),
                if (selectedAssetPath != null) ...[
                  const SizedBox(height: AppSpacing.md),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () {
                        controller.removeAttachedImage();
                        Navigator.of(sheetContext).pop();
                      },
                      icon: const Icon(Icons.delete_outline_rounded),
                      label: Text(l10n.messageDetailRemoveImage),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _sendMessage() async {
    final provider = chatDetailControllerProvider(widget.conversationId);
    final controller = ref.read(provider.notifier);
    final text = _messageController.text;

    _messageController.clear();
    await controller.sendMessage(text: text);
    _scrollToBottom();
  }

  void _onDraftChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  void _scrollToBottom() {
    if (!_scrollController.hasClients) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) {
        return;
      }

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 48,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
    });
  }
}

class _ConversationAppBarTitle extends StatelessWidget {
  const _ConversationAppBarTitle({
    required this.workerName,
    required this.workerAvatarUrl,
    required this.professionTitle,
    required this.subtitle,
  });

  final String? workerName;
  final String? workerAvatarUrl;
  final String? professionTitle;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final displayName = l10n.workerDisplayName(workerName ?? '');
    final fallbackName = displayName.isEmpty
        ? l10n.messagesAppBar
        : displayName;

    return Row(
      children: [
        AvatarView(name: fallbackName, avatarUrl: workerAvatarUrl, radius: 18),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fallbackName,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                professionTitle == null || professionTitle!.isEmpty
                    ? subtitle
                    : '${l10n.workerProfession(professionTitle!)} • $subtitle',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({required this.message, this.onTap});

  final ChatMessage message;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final isMine = message.isFromCurrentUser;
    final statusColor = switch (message.deliveryStatus) {
      ChatMessageDeliveryStatus.failed => theme.colorScheme.error,
      ChatMessageDeliveryStatus.read => theme.colorScheme.primary,
      _ => theme.colorScheme.onSurfaceVariant,
    };

    final bubble = Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width * 0.72,
      ),
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
      decoration: BoxDecoration(
        color: isMine
            ? theme.colorScheme.primaryContainer
            : theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: message.deliveryStatus == ChatMessageDeliveryStatus.failed
            ? Border.all(color: theme.colorScheme.error, width: 1)
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message.hasImage)
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.sm),
              child: Image.asset(
                message.imageAssetPath!,
                width: 180,
                height: 140,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 180,
                  height: 140,
                  color: theme.colorScheme.surfaceContainerLowest,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.broken_image_outlined,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          if (message.hasImage && message.hasText)
            const SizedBox(height: AppSpacing.sm),
          if (message.hasText)
            Text(
              l10n.chatMessage(message.text!),
              style: theme.textTheme.bodyMedium,
            ),
          const SizedBox(height: 6),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                DateFormat('HH:mm').format(message.createdAt),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              if (isMine) ...[
                const SizedBox(width: 8),
                if (message.deliveryStatus == ChatMessageDeliveryStatus.failed)
                  Icon(
                    Icons.error_outline_rounded,
                    size: 14,
                    color: statusColor,
                  )
                else if (message.deliveryStatus ==
                    ChatMessageDeliveryStatus.read)
                  Icon(Icons.done_all_rounded, size: 14, color: statusColor)
                else
                  Icon(Icons.check_rounded, size: 14, color: statusColor),
                const SizedBox(width: 4),
                Text(
                  _statusLabel(l10n, message.deliveryStatus),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: statusColor,
                    fontWeight:
                        message.deliveryStatus ==
                            ChatMessageDeliveryStatus.failed
                        ? FontWeight.w700
                        : FontWeight.w500,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );

    return Row(
      mainAxisAlignment: isMine
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        if (message.deliveryStatus == ChatMessageDeliveryStatus.failed &&
            onTap != null)
          InkWell(
            borderRadius: BorderRadius.circular(AppRadius.md),
            onTap: onTap,
            child: bubble,
          )
        else
          bubble,
      ],
    );
  }

  String _statusLabel(AppLocalizations l10n, ChatMessageDeliveryStatus status) {
    return switch (status) {
      ChatMessageDeliveryStatus.sending => l10n.messageStatusSending,
      ChatMessageDeliveryStatus.sent => l10n.messageStatusSent,
      ChatMessageDeliveryStatus.read => l10n.messageStatusRead,
      ChatMessageDeliveryStatus.failed => l10n.messageStatusFailedTapToRetry,
    };
  }
}

class _TypingIndicatorBubble extends StatelessWidget {
  const _TypingIndicatorBubble();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 18,
                child: _TypingDot(delayMilliseconds: 0),
              ),
              const SizedBox(
                width: 18,
                child: _TypingDot(delayMilliseconds: 150),
              ),
              const SizedBox(
                width: 18,
                child: _TypingDot(delayMilliseconds: 300),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TypingDot extends StatefulWidget {
  const _TypingDot({required this.delayMilliseconds});

  final int delayMilliseconds;

  @override
  State<_TypingDot> createState() => _TypingDotState();
}

class _TypingDotState extends State<_TypingDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    _opacity = Tween<double>(
      begin: 0.25,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacity,
      builder: (context, _) {
        final delayedValue =
            (_controller.value + widget.delayMilliseconds / 900) % 1;
        final dotOpacity = Tween<double>(
          begin: 0.25,
          end: 1,
        ).transform(delayedValue);

        return Opacity(
          opacity: dotOpacity,
          child: Text(
            '•',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w900,
            ),
          ),
        );
      },
    );
  }
}

class _ChatComposer extends StatelessWidget {
  const _ChatComposer({
    required this.controller,
    required this.selectedImageAssetPath,
    required this.canSend,
    required this.onSendPressed,
    required this.onAttachPressed,
    required this.onRemoveAttachment,
  });

  final TextEditingController controller;
  final String? selectedImageAssetPath;
  final bool canSend;
  final VoidCallback? onSendPressed;
  final VoidCallback onAttachPressed;
  final VoidCallback onRemoveAttachment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: theme.colorScheme.outlineVariant),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (selectedImageAssetPath != null)
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                    child: Image.asset(
                      selectedImageAssetPath!,
                      width: 52,
                      height: 52,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      l10n.messageDetailSelectedImage,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  IconButton(
                    tooltip: l10n.messageDetailChangeImage,
                    onPressed: onAttachPressed,
                    icon: const Icon(Icons.edit_outlined),
                  ),
                  IconButton(
                    tooltip: l10n.messageDetailRemoveImage,
                    onPressed: onRemoveAttachment,
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
              ),
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                tooltip: l10n.messageDetailAttachImage,
                onPressed: onAttachPressed,
                icon: const Icon(Icons.image_outlined),
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  minLines: 1,
                  maxLines: 4,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    hintText: l10n.messageDetailInputHint,
                    filled: true,
                    fillColor: theme.colorScheme.surfaceContainerLow,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                tooltip: l10n.messageDetailSend,
                onPressed: onSendPressed,
                icon: const Icon(Icons.send_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AttachmentTile extends StatelessWidget {
  const _AttachmentTile({
    required this.assetPath,
    required this.isSelected,
    required this.onTap,
  });

  final String assetPath;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.sm),
      child: Ink(
        width: 92,
        height: 92,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          border: Border.all(
            color: isSelected
                ? theme.colorScheme.primary
                : theme.colorScheme.outlineVariant,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.sm - 1),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(assetPath, fit: BoxFit.cover),
              if (isSelected)
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      size: 14,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
