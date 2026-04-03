import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/preview/app_preview.dart';
import 'package:alo_tho/core/widgets/app_empty_state.dart';
import 'package:alo_tho/core/widgets/app_error_view.dart';
import 'package:alo_tho/core/widgets/app_loading_state.dart';
import 'package:alo_tho/core/widgets/app_page_body.dart';
import 'package:alo_tho/core/widgets/app_search_field.dart';
import 'package:alo_tho/core/widgets/section_header.dart';
import 'package:alo_tho/app/app_routes.dart';
import 'package:alo_tho/features/chat/presentation/viewmodels/message_list_view_model.dart';
import 'package:alo_tho/features/chat/presentation/viewmodels/message_list_state.dart';
import 'package:alo_tho/features/chat/presentation/widgets/chat_preview_card.dart';
import 'package:alo_tho/features/chat/presentation/widgets/recommended_worker_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widget_previews.dart';
import 'package:go_router/go_router.dart';

@Preview(
  group: 'Screens',
  name: 'Message List Page',
  size: phonePreviewSize,
  wrapper: appPreviewWrapper,
)
Widget previewMessageListPage() => const MessageListPage();
class MessageListPage extends ConsumerWidget {
  const MessageListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final state = ref.watch(messageListControllerProvider);
    final controller = ref.read(messageListControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.messagesAppBar)),
      body: AppPageBody(
        child: RefreshIndicator(
          onRefresh: controller.load,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: AppSpacing.screenPadding,
            children: [
              SectionHeader(
                title: l10n.recentConversationsTitle,
                subtitle: l10n.recentConversationsSubtitle,
              ),
              const SizedBox(height: AppSpacing.md),
              AppSearchField(
                hintText: l10n.messageSearchHint,
                onChanged: controller.updateSearchQuery,
              ),
              const SizedBox(height: AppSpacing.md),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  FilterChip(
                    selected: state.unreadOnly,
                    label: Text(l10n.unreadOnly),
                    onSelected: controller.toggleUnreadOnly,
                  ),
                  ChoiceChip(
                    selected: state.sortOption == MessageSortOption.latest,
                    label: Text(l10n.latestFirst),
                    onSelected: (_) =>
                        controller.changeSortOption(MessageSortOption.latest),
                  ),
                  ChoiceChip(
                    selected: state.sortOption == MessageSortOption.oldest,
                    label: Text(l10n.oldestFirst),
                    onSelected: (_) =>
                        controller.changeSortOption(MessageSortOption.oldest),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              if (state.isLoading)
                AppLoadingState(
                  title: l10n.messagesAppBar,
                  description: l10n.recentConversationsSubtitle,
                )
              else if (state.errorMessage != null)
                AppErrorView(
                  message: state.errorMessage!,
                  onRetry: controller.load,
                  title: l10n.messagesAppBar,
                )
              else ...[
                SectionHeader(
                  title: l10n.conversationListTitle,
                  subtitle: l10n.conversationsCount(
                    state.filteredPreviews.length,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                if (state.filteredPreviews.isEmpty)
                  AppEmptyState(
                    title: l10n.noMatchingConversationsTitle,
                    description: l10n.noMatchingConversationsDescription,
                  )
                else
                  ...state.filteredPreviews.map(
                    (preview) => Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.md),
                      child: ChatPreviewCard(preview: preview),
                    ),
                  ),
                const SizedBox(height: AppSpacing.lg),
                SectionHeader(
                  title: l10n.readyWorkersTitle,
                  subtitle: l10n.readyWorkersSubtitle,
                ),
                const SizedBox(height: AppSpacing.md),
                ...state.recommendedWorkers.map(
                  (worker) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: RecommendedWorkerTile(
                      worker: worker,
                      onViewDetail: () {
                        context.go(AppRoutes.workerDetailPath(worker.id));
                      },
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}


