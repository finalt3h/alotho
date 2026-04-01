import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/widgets/app_section_card.dart';
import 'package:alo_tho/core/widgets/avatar_view.dart';
import 'package:alo_tho/features/profile/domain/entities/profile_summary.dart';
import 'package:flutter/material.dart';

class ProfileOverviewCard extends StatelessWidget {
  const ProfileOverviewCard({
    required this.title,
    required this.summary,
    super.key,
  });

  final String title;
  final ProfileSummary summary;

  @override
  Widget build(BuildContext context) {
    return AppSectionCard(
      title: title,
      child: Row(
        children: [
          AvatarView(
            name: summary.user.fullName,
            avatarUrl: summary.user.avatarUrl,
            radius: 32,
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  summary.user.fullName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(summary.user.phoneNumber),
                const SizedBox(height: 4),
                Text(summary.user.city),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
