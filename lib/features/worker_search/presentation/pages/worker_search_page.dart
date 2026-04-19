import 'dart:math' as math;

import 'package:alo_tho/app/app_routes.dart';
import 'package:alo_tho/app/theme/app_theme.dart';
import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/preview/app_preview.dart';
import 'package:alo_tho/core/widgets/app_empty_state.dart';
import 'package:alo_tho/core/widgets/app_error_view.dart';
import 'package:alo_tho/core/widgets/app_loading_state.dart';
import 'package:alo_tho/core/widgets/app_page_body.dart';
import 'package:alo_tho/core/widgets/app_status_dialog.dart';
import 'package:alo_tho/features/worker_search/domain/entities/service_category.dart';
import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';
import 'package:alo_tho/features/worker_search/presentation/viewmodels/worker_search_state.dart';
import 'package:alo_tho/features/worker_search/presentation/viewmodels/worker_search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widget_previews.dart';
import 'package:go_router/go_router.dart';

@Preview(
  group: 'Screens',
  name: 'Worker Search Page',
  size: phonePreviewSize,
  wrapper: appPreviewWrapper,
)
Widget previewWorkerSearchPage() => const WorkerSearchPage();

class WorkerSearchPage extends ConsumerWidget {
  const WorkerSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final state = ref.watch(workerSearchControllerProvider);
    final controller = ref.read(workerSearchControllerProvider.notifier);
    final quickServices = _buildQuickServices(l10n, state.categories);
    final hasActiveFilters =
        state.searchQuery.trim().isNotEmpty || state.selectedCategoryId != null;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: AppPageBody(
          child: RefreshIndicator(
            color: theme.colorScheme.primary,
            onRefresh: controller.load,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              children: [
                _WelcomeSection(
                  greeting: l10n.workerSearchGreetingMorning,
                  displayName: l10n.workerSearchGreetingGuestName,
                  currentCity: l10n.workerSearchCurrentCity,
                ),
                const SizedBox(height: 16),
                _SearchBar(
                  hintText: l10n.workerSearchHint,
                  onChanged: controller.updateSearchQuery,
                ),
                const SizedBox(height: 16),
                _PromoBanner(
                  eyebrow: l10n.workerSearchPromoEyebrow,
                  titleLineOne: l10n.workerSearchPromoTitleLineOne,
                  titleLineTwo: l10n.workerSearchPromoTitleLineTwo,
                  actionLabel: l10n.workerSearchPromoButton,
                  onPressed: () => _showPlaceholder(context, l10n),
                ),
                const SizedBox(height: 20),
                _SectionHeaderRow(
                  title: l10n.workerSearchPopularServicesTitle,
                  trailing: TextButton(
                    onPressed: hasActiveFilters
                        ? controller.clearFilters
                        : null,
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.primary,
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      l10n.workerDetailSeeAll,
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                if (quickServices.isEmpty && state.isLoading)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Center(child: CircularProgressIndicator()),
                  )
                else
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: quickServices.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.72,
                        ),
                    itemBuilder: (context, index) {
                      final quickService = quickServices[index];
                      final isSelected =
                          quickService.categoryId != null &&
                          state.selectedCategoryId == quickService.categoryId;

                      return _QuickServiceTile(
                        label: quickService.label,
                        icon: quickService.icon,
                        isSelected: isSelected,
                        onTap: () {
                          if (quickService.categoryId == null) {
                            _showPlaceholder(context, l10n);
                            return;
                          }
                          controller.selectCategory(quickService.categoryId);
                        },
                      );
                    },
                  ),
                const SizedBox(height: 20),
                _UrgentHelpCard(
                  title: l10n.workerSearchUrgentTitle,
                  subtitle: l10n.workerSearchUrgentSubtitle,
                  actionLabel: l10n.workerSearchUrgentAction,
                  onPressed: () => _showPlaceholder(context, l10n),
                ),
                const SizedBox(height: 20),
                _SectionHeaderRow(
                  title: l10n.workerSearchNearbyTitle,
                  trailing: IconButton(
                    onPressed: hasActiveFilters
                        ? controller.clearFilters
                        : null,
                    tooltip: hasActiveFilters ? l10n.retry : null,
                    style: IconButton.styleFrom(
                      backgroundColor: theme.colorScheme.surfaceContainerLow,
                      foregroundColor: hasActiveFilters
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                    icon: const Icon(Icons.tune_rounded, size: 18),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.matchingResults(state.filteredWorkers.length),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                ..._buildWorkerSection(
                  context: context,
                  state: state,
                  onRetry: controller.load,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static List<Widget> _buildWorkerSection({
    required BuildContext context,
    required WorkerSearchState state,
    required Future<void> Function() onRetry,
  }) {
    final l10n = context.l10n;

    if (state.isLoading && state.filteredWorkers.isEmpty) {
      return [
        AppLoadingState(
          title: l10n.workerSearchNearbyTitle,
          description: l10n.workerSearchSubtitle,
        ),
      ];
    }

    if (state.errorMessage != null) {
      return [
        AppErrorView(
          message: state.errorMessage!,
          onRetry: onRetry,
          title: l10n.workerSearchNearbyTitle,
        ),
      ];
    }

    if (state.filteredWorkers.isEmpty) {
      return [
        AppEmptyState(
          title: l10n.noMatchingWorkersTitle,
          description: l10n.noMatchingWorkersDescription,
        ),
      ];
    }

    return [
      for (var index = 0; index < state.filteredWorkers.length; index++) ...[
        _WorkerSpotlightCard(
          worker: state.filteredWorkers[index],
          index: index,
        ),
        if (index < state.filteredWorkers.length - 1)
          const SizedBox(height: 16),
      ],
    ];
  }

  static List<_QuickServiceData> _buildQuickServices(
    AppLocalizations l10n,
    List<ServiceCategory> categories,
  ) {
    if (categories.isEmpty) {
      return const [];
    }

    return categories
        .map(
          (category) => _QuickServiceData(
            label: l10n.categoryName(category.name),
            icon: _serviceIcon(category.iconName),
            categoryId: category.id,
          ),
        )
        .toList();
  }

  static IconData _serviceIcon(String iconName) {
    return switch (iconName) {
      'bolt' => Icons.electrical_services_rounded,
      'water_drop' => Icons.plumbing_rounded,
      'ac_unit' => Icons.ac_unit_rounded,
      'kitchen' => Icons.kitchen_rounded,
      'format_paint' => Icons.format_paint_rounded,
      _ => Icons.handyman_rounded,
    };
  }

  static void _showPlaceholder(BuildContext context, AppLocalizations l10n) {
    showAppStatusDialog(
      context: context,
      state: AppStatusDialogState.alert,
      title: appStatusDialogDefaultTitle(context, AppStatusDialogState.alert),
      message: l10n.authActionPlaceholder,
    );
  }
}

class _WelcomeSection extends StatelessWidget {
  const _WelcomeSection({
    required this.greeting,
    required this.displayName,
    required this.currentCity,
  });

  final String greeting;
  final String displayName;
  final String currentCity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '$displayName 👋',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.75,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(AppRadius.pill),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_on_rounded,
                size: 16,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 6),
              Text(
                currentCity,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 2),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 18,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({required this.hintText, required this.onChanged});

  final String hintText;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadius.xxxl),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          Icon(
            Icons.search_rounded,
            size: 20,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              textInputAction: TextInputAction.search,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                filled: false,
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PromoBanner extends StatelessWidget {
  const _PromoBanner({
    required this.eyebrow,
    required this.titleLineOne,
    required this.titleLineTwo,
    required this.actionLabel,
    required this.onPressed,
  });

  final String eyebrow;
  final String titleLineOne;
  final String titleLineTwo;
  final String actionLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gradientStart = _darken(theme.colorScheme.primary, 0.18);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.xxxl),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [gradientStart, theme.colorScheme.primary],
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -10,
            right: -28,
            child: Container(
              width: 144,
              height: 144,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.08),
                    blurRadius: 36,
                    spreadRadius: 8,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 26,
            bottom: 28,
            child: Icon(
              Icons.verified_user_outlined,
              size: 92,
              color: Colors.white.withValues(alpha: 0.22),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 220),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eyebrow.toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: Colors.white.withValues(alpha: 0.82),
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '$titleLineOne\n$titleLineTwo',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 14),
                TextButton(
                  onPressed: onPressed,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: gradientStart,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                  ),
                  child: Text(
                    actionLabel,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: gradientStart,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeaderRow extends StatelessWidget {
  const _SectionHeaderRow({required this.title, required this.trailing});

  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        trailing,
      ],
    );
  }
}

class _QuickServiceTile extends StatelessWidget {
  const _QuickServiceTile({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = isSelected
        ? theme.colorScheme.primaryContainer
        : theme.colorScheme.surfaceContainerLow;
    final foregroundColor = isSelected
        ? theme.colorScheme.primary
        : theme.colorScheme.onSurface;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
            child: Icon(icon, size: 24, color: foregroundColor),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              label,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w700,
                height: 1.25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UrgentHelpCard extends StatelessWidget {
  const _UrgentHelpCard({
    required this.title,
    required this.subtitle,
    required this.actionLabel,
    required this.onPressed,
  });

  final String title;
  final String subtitle;
  final String actionLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: theme.colorScheme.secondary.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.emergency_rounded,
              color: theme.colorScheme.onSecondary,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              minimumSize: const Size(0, 40),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              backgroundColor: theme.colorScheme.secondary,
              foregroundColor: theme.colorScheme.onSecondary,
            ),
            child: Text(actionLabel),
          ),
        ],
      ),
    );
  }
}

class _WorkerSpotlightCard extends StatelessWidget {
  const _WorkerSpotlightCard({required this.worker, required this.index});

  final Worker worker;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final isAvailable = index.isEven;
    final availability = isAvailable
        ? l10n.workerSearchAvailableNow
        : l10n.workerSearchBusyNow;
    final availabilityBackground = isAvailable
        ? AppThemeColors.hex0xFFDCFCE7
        : theme.colorScheme.surfaceContainerLow;
    final availabilityForeground = isAvailable
        ? AppThemeColors.hex0xFF15803D
        : theme.colorScheme.onSurfaceVariant;
    final warningColor =
        theme.extension<AppThemeAccent>()?.warning ??
        theme.colorScheme.tertiary;
    final localizedPrice = l10n.priceDescription(worker.priceDescription);
    final actionLabel = isAvailable
        ? l10n.workerSearchActionContact
        : l10n.workerSearchActionBookAhead;

    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppRadius.xxxl),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.24),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withValues(alpha: 0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _WorkerAvatar(
                  avatarUrl: worker.avatarUrl,
                  fullName: l10n.workerDisplayName(worker.fullName),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              l10n.workerShortName(worker.fullName),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: theme.colorScheme.onSurface,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: availabilityBackground,
                              borderRadius: BorderRadius.circular(AppRadius.xs),
                            ),
                            child: Text(
                              availability.toUpperCase(),
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: availabilityForeground,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            size: 14,
                            color: warningColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            worker.rating.toStringAsFixed(1),
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '•',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${worker.distanceInKm.toStringAsFixed(1)} km',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.workerSearchSpecialty(
                          l10n.workerProfession(worker.professionTitle),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                          height: 1.45,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.workerSearchEstimateFrom.toUpperCase(),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.55,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _priceAmount(localizedPrice),
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () {
                    context.go(AppRoutes.workerDetailPath(worker.id));
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(0, 40),
                    backgroundColor: theme.colorScheme.surfaceContainerLow,
                    side: BorderSide.none,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  child: Text(l10n.details),
                ),
                const SizedBox(width: 8),
                _GradientActionButton(
                  label: actionLabel,
                  onPressed: () {
                    showAppStatusDialog(
                      context: context,
                      state: AppStatusDialogState.alert,
                      title: appStatusDialogDefaultTitle(
                        context,
                        AppStatusDialogState.alert,
                      ),
                      message: l10n.workerContactPlaceholder,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WorkerAvatar extends StatelessWidget {
  const _WorkerAvatar({required this.avatarUrl, required this.fullName});

  final String? avatarUrl;
  final String fullName;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: SizedBox(
        width: 80,
        height: 80,
        child: avatarUrl != null && avatarUrl!.isNotEmpty
            ? Image.network(
                avatarUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _AvatarFallback(fullName: fullName),
              )
            : _AvatarFallback(fullName: fullName),
      ),
    );
  }
}

class _AvatarFallback extends StatelessWidget {
  const _AvatarFallback({required this.fullName});

  final String fullName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final initials = fullName
        .trim()
        .split(' ')
        .where((part) => part.isNotEmpty)
        .take(2)
        .map((part) => part.characters.first.toUpperCase())
        .join();

    return Container(
      color: theme.colorScheme.primaryContainer,
      alignment: Alignment.center,
      child: Text(
        initials,
        style: theme.textTheme.titleLarge?.copyWith(
          color: theme.colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _GradientActionButton extends StatelessWidget {
  const _GradientActionButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.sm),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _darken(theme.colorScheme.primary, 0.18),
            theme.colorScheme.primary,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.24),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(AppRadius.sm),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              label,
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _QuickServiceData {
  const _QuickServiceData({
    required this.label,
    required this.icon,
    required this.categoryId,
  });

  final String label;
  final IconData icon;
  final String? categoryId;
}

String _priceAmount(String localizedPrice) {
  return localizedPrice
      .replaceFirst('Từ ', '')
      .replaceFirst('From ', '')
      .trim();
}

Color _darken(Color color, double amount) {
  final hsl = HSLColor.fromColor(color);
  final nextLightness = math.max(0.0, hsl.lightness - amount).toDouble();
  return hsl.withLightness(nextLightness).toColor();
}
