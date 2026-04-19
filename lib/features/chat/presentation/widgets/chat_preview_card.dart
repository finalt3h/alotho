import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/widgets/avatar_view.dart';
import 'package:alo_tho/features/chat/domain/entities/chat_preview.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatPreviewCard extends StatelessWidget {
  const ChatPreviewCard({required this.preview, this.onTap, super.key});

  final ChatPreview preview;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final timeLabel = DateFormat('HH:mm • dd/MM').format(preview.updatedAt);
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final displayName = l10n.workerDisplayName(preview.workerName);

    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.surface),
          gradient: preview.unreadCount > 0
              ? LinearGradient(
                  colors: [
                    theme.colorScheme.primaryContainer.withValues(alpha: 0.55),
                    theme.colorScheme.surface,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
        ),
        child: ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.all(AppSpacing.md),
          leading: AvatarView(
            name: displayName,
            avatarUrl: preview.workerAvatarUrl,
          ),
          title: Text(
            displayName,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: AppSpacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  timeLabel,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  l10n.workerProfession(preview.professionTitle),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  l10n.chatMessage(preview.lastMessage),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          trailing: preview.unreadCount > 0
              ? CircleAvatar(
                  radius: 12,
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  child: Text(
                    '${preview.unreadCount}',
                    style: theme.textTheme.labelSmall,
                  ),
                )
              : Icon(
                  Icons.chevron_right_rounded,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
        ),
      ),
    );
  }
}
