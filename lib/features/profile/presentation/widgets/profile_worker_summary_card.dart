import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/widgets/app_section_card.dart';
import 'package:alo_tho/core/widgets/app_empty_state.dart';
import 'package:alo_tho/features/profile/domain/entities/profile_summary.dart';
import 'package:flutter/material.dart';

class ProfileWorkerSummaryCard extends StatelessWidget {
  const ProfileWorkerSummaryCard({
    required this.title,
    required this.summary,
    super.key,
  });

  final String title;
  final ProfileSummary summary;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final workerProfile = summary.workerProfile;

    return AppSectionCard(
      title: title,
      child: workerProfile == null
          ? AppEmptyState(
              title: l10n.noWorkerProfile,
              description: l10n.profileSubtitle,
              icon: Icons.engineering_outlined,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.workerProfession(workerProfile.professionTitle),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(l10n.workerBio(workerProfile.shortBio)),
                const SizedBox(height: AppSpacing.md),
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: [
                    Chip(
                      label: Text(
                        l10n.yearsExperienceLong(
                          workerProfile.yearsOfExperience,
                        ),
                      ),
                    ),
                    Chip(
                      label: Text(
                        l10n.completedRepairsLabel(workerProfile.completedJobs),
                      ),
                    ),
                    Chip(label: Text(l10n.ratingLabel(workerProfile.rating))),
                  ],
                ),
              ],
            ),
    );
  }
}
