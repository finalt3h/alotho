import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/widgets/app_section_card.dart';
import 'package:alo_tho/core/widgets/app_status_dialog.dart';
import 'package:alo_tho/features/profile/domain/entities/profile_summary.dart';
import 'package:flutter/material.dart';

class ProfileVerificationCard extends StatelessWidget {
  const ProfileVerificationCard({
    required this.title,
    required this.summary,
    super.key,
  });

  final String title;
  final ProfileSummary summary;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final statusText = summary.isKycApproved
        ? l10n.kycApproved
        : summary.isKycSubmitted
        ? l10n.kycPending
        : l10n.kycNotSubmitted;

    return AppSectionCard(
      title: title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(statusText),
          const SizedBox(height: AppSpacing.md),
          OutlinedButton.icon(
            onPressed: () {
              showAppStatusDialog(
                context: context,
                state: AppStatusDialogState.alert,
                title: appStatusDialogDefaultTitle(
                  context,
                  AppStatusDialogState.alert,
                ),
                message: l10n.kycPlaceholder,
              );
            },
            icon: const Icon(Icons.verified_user_outlined),
            label: Text(l10n.viewKyc),
          ),
        ],
      ),
    );
  }
}
