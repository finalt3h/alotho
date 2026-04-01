import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/widgets/app_section_card.dart';
import 'package:alo_tho/core/widgets/avatar_view.dart';
import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';
import 'package:flutter/material.dart';

class WorkerDetailSummaryCard extends StatelessWidget {
  const WorkerDetailSummaryCard({required this.worker, super.key});

  final Worker worker;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AvatarView(
                name: worker.fullName,
                avatarUrl: worker.avatarUrl,
                radius: 34,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      worker.fullName,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(l10n.workerProfession(worker.professionTitle)),
                    const SizedBox(height: 4),
                    Text(
                      '${worker.area} • ${l10n.distanceLabel(worker.distanceInKm)}',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            l10n.workerBio(worker.shortBio),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              Chip(
                label: Text(l10n.yearsExperienceLong(worker.yearsOfExperience)),
                avatar: const Icon(Icons.workspace_premium_outlined),
              ),
              Chip(
                label: Text(l10n.ratingLabel(worker.rating)),
                avatar: const Icon(Icons.star_rounded),
              ),
              Chip(
                label: Text(l10n.completedRepairsLabel(worker.completedJobs)),
                avatar: const Icon(Icons.build_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
