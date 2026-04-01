import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/widgets/avatar_view.dart';
import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';
import 'package:flutter/material.dart';

class WorkerCard extends StatelessWidget {
  const WorkerCard({
    required this.worker,
    required this.onViewDetail,
    super.key,
  });

  final Worker worker;
  final VoidCallback onViewDetail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Card(
      child: Padding(
        padding: AppSpacing.cardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarView(name: worker.fullName, avatarUrl: worker.avatarUrl),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        worker.fullName,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        l10n.ageAndProfession(
                          worker.age,
                          worker.professionTitle,
                        ),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        l10n.priceDescription(worker.priceDescription),
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      FilledButton.tonal(
                        onPressed: onViewDetail,
                        child: Text(l10n.details),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                _InfoChip(label: worker.area, icon: Icons.place_outlined),
                _InfoChip(
                  label: l10n.yearsExperienceShort(worker.yearsOfExperience),
                  icon: Icons.workspace_premium_outlined,
                ),
                _InfoChip(
                  label: l10n.ratingLabel(worker.rating),
                  icon: Icons.star_rounded,
                ),
                _InfoChip(
                  label: l10n.completedJobsLabel(worker.completedJobs),
                  icon: Icons.build_circle_outlined,
                ),
                _InfoChip(
                  label: l10n.distanceLabel(worker.distanceInKm),
                  icon: Icons.near_me_outlined,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text(l10n.workerBio(worker.shortBio)),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.45,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: theme.colorScheme.primary),
          const SizedBox(width: 6),
          Text(label),
        ],
      ),
    );
  }
}
