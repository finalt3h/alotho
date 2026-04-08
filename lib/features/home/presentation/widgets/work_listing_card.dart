import 'package:alo_tho/app/theme/app_theme.dart';
import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/features/home/domain/entities/work_listing.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkListingCard extends StatelessWidget {
  const WorkListingCard({required this.listing, super.key});

  final WorkListing listing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = theme.extension<AppThemeAccent>();
    final postedLabel = DateFormat('HH:mm • dd/MM').format(listing.postedAt);
    final l10n = context.l10n;
    final statusColor = switch (listing.statusLabel) {
      'Dang hien thi tot' => theme.colorScheme.primary,
      'On dinh' => theme.colorScheme.secondary,
      'Can tang tuong tac' => accent?.warning ?? theme.colorScheme.tertiary,
      _ => theme.colorScheme.primary,
    };

    return Card(
      child: Padding(
        padding: AppSpacing.cardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.workListingTitle(listing.title),
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Chip(
              backgroundColor: statusColor.withValues(alpha: 0.12),
              side: BorderSide(color: statusColor.withValues(alpha: 0.2)),
              label: Text(
                l10n.listingStatus(listing.statusLabel),
                style: theme.textTheme.labelMedium?.copyWith(
                  color: statusColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              '${l10n.categoryName(listing.categoryName)} • ${l10n.areaName(listing.area)}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                _MetricPill(
                  label: l10n.visiblePlacement(listing.visibleInCategory),
                  icon: Icons.sell,
                ),
                _MetricPill(
                  label: l10n.viewsCount(listing.viewCount),
                  icon: Icons.visibility_outlined,
                ),
                _MetricPill(
                  label: l10n.contactCount(listing.contactCount),
                  icon: Icons.forum_outlined,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              l10n.updatedAtLabel(postedLabel),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricPill extends StatelessWidget {
  const _MetricPill({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      constraints: const BoxConstraints(maxWidth: 260),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.45,
        ),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: theme.colorScheme.primary),
          const SizedBox(width: 6),
          Expanded(child: Text(label, softWrap: true)),
        ],
      ),
    );
  }
}
