import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/preview/app_preview.dart';
import 'package:alo_tho/core/widgets/app_error_view.dart';
import 'package:alo_tho/core/widgets/app_loading_state.dart';
import 'package:alo_tho/core/widgets/app_page_body.dart';
import 'package:alo_tho/core/widgets/app_status_dialog.dart';
import 'package:alo_tho/core/widgets/section_header.dart';
import 'package:alo_tho/features/profile/presentation/viewmodels/profile_view_model.dart';
import 'package:alo_tho/features/profile/presentation/widgets/profile_overview_card.dart';
import 'package:alo_tho/features/profile/presentation/widgets/profile_preferences_card.dart';
import 'package:alo_tho/features/profile/presentation/widgets/profile_verification_card.dart';
import 'package:alo_tho/features/profile/presentation/widgets/profile_worker_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widget_previews.dart';

@Preview(
  group: 'Screens',
  name: 'Profile Page',
  size: phonePreviewSize,
  wrapper: appPreviewWrapper,
)
Widget previewProfilePage() => const ProfilePage();

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    ref.listen(profileControllerProvider, (previous, next) {
      if (next.signOutErrorMessage != null &&
          next.signOutErrorMessage != previous?.signOutErrorMessage) {
        showAppStatusDialog(
          context: context,
          state: AppStatusDialogState.error,
          title: appStatusDialogDefaultTitle(
            context,
            AppStatusDialogState.error,
          ),
          message: l10n.localizeFailureMessage(next.signOutErrorMessage!),
        );
      }
    });

    final state = ref.watch(profileControllerProvider);
    final controller = ref.read(profileControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.profileAppBar)),
      body: AppPageBody(
        child: RefreshIndicator(
          onRefresh: controller.load,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: AppSpacing.screenPadding,
            children: [
              SectionHeader(
                title: l10n.profileHeadline,
                subtitle: l10n.profileSubtitle,
              ),
              const SizedBox(height: AppSpacing.lg),
              if (state.isLoading)
                AppLoadingState(
                  title: l10n.profileAppBar,
                  description: l10n.profileSubtitle,
                )
              else if (state.errorMessage != null)
                AppErrorView(
                  message: state.errorMessage!,
                  onRetry: controller.load,
                  title: l10n.profileAppBar,
                )
              else ...[
                ProfileOverviewCard(
                  title: l10n.accountInfoTitle,
                  summary: state.summary!,
                ),
                const SizedBox(height: AppSpacing.md),
                ProfileWorkerSummaryCard(
                  title: l10n.workerProfileTitle,
                  summary: state.summary!,
                ),
                const SizedBox(height: AppSpacing.md),
                ProfileVerificationCard(
                  title: l10n.kycTitle,
                  summary: state.summary!,
                ),
                const SizedBox(height: AppSpacing.md),
                ProfilePreferencesCard(
                  title: l10n.preferencesTitle,
                  isSigningOut: state.isSigningOut,
                  onSignOut: controller.signOut,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
