import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/widgets/app_empty_state.dart';
import 'package:alo_tho/core/widgets/app_error_view.dart';
import 'package:alo_tho/core/widgets/app_loading_state.dart';
import 'package:alo_tho/core/widgets/app_page_body.dart';
import 'package:alo_tho/core/widgets/app_search_field.dart';
import 'package:alo_tho/core/widgets/section_header.dart';
import 'package:alo_tho/app/app_routes.dart';
import 'package:alo_tho/features/worker_search/presentation/viewmodels/worker_search_view_model.dart';
import 'package:alo_tho/features/worker_search/presentation/widgets/service_category_chip.dart';
import 'package:alo_tho/features/worker_search/presentation/widgets/worker_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WorkerSearchPage extends ConsumerWidget {
  const WorkerSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final state = ref.watch(workerSearchControllerProvider);
    final controller = ref.read(workerSearchControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.workerSearchAppBar)),
      body: AppPageBody(
        child: RefreshIndicator(
          onRefresh: controller.load,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: AppSpacing.screenPadding,
            children: [
              SectionHeader(
                title: l10n.workerSearchHeadline,
                subtitle: l10n.workerSearchSubtitle,
              ),
              const SizedBox(height: AppSpacing.md),
              AppSearchField(
                hintText: l10n.workerSearchHint,
                onChanged: controller.updateSearchQuery,
              ),
              const SizedBox(height: AppSpacing.lg),
              SectionHeader(title: l10n.serviceCategoriesTitle),
              const SizedBox(height: AppSpacing.md),
              SizedBox(
                height: 52,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categories.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(width: AppSpacing.sm),
                  itemBuilder: (context, index) {
                    final category = state.categories[index];
                    return ServiceCategoryChip(
                      category: category,
                      isSelected: state.selectedCategoryId == category.id,
                      onTap: () => controller.selectCategory(category.id),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              SectionHeader(title: l10n.suggestedAreasTitle),
              const SizedBox(height: AppSpacing.md),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  for (final area in state.suggestedAreas)
                    Chip(
                      label: Text(area),
                      avatar: const Icon(Icons.location_on_outlined, size: 18),
                    ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              SectionHeader(
                title: l10n.workerListTitle,
                subtitle: l10n.matchingResults(state.filteredWorkers.length),
              ),
              const SizedBox(height: AppSpacing.md),
              if (state.isLoading)
                AppLoadingState(
                  title: l10n.workerListTitle,
                  description: l10n.workerSearchSubtitle,
                )
              else if (state.errorMessage != null)
                AppErrorView(
                  message: state.errorMessage!,
                  onRetry: controller.load,
                  title: l10n.workerListTitle,
                )
              else if (state.filteredWorkers.isEmpty)
                AppEmptyState(
                  title: l10n.noMatchingWorkersTitle,
                  description: l10n.noMatchingWorkersDescription,
                  action: OutlinedButton.icon(
                    onPressed: controller.clearFilters,
                    icon: const Icon(Icons.filter_alt_off_outlined),
                    label: Text(l10n.retry),
                  ),
                )
              else
                ...state.filteredWorkers.map(
                  (worker) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: WorkerCard(
                      worker: worker,
                      onViewDetail: () {
                        context.go(AppRoutes.workerDetailPath(worker.id));
                      },
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
