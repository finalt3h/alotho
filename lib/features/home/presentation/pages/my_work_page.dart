import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/preview/app_preview.dart';
import 'package:alo_tho/core/widgets/app_error_view.dart';
import 'package:alo_tho/core/widgets/app_loading_state.dart';
import 'package:alo_tho/core/widgets/app_page_body.dart';
import 'package:alo_tho/core/widgets/section_header.dart';
import 'package:alo_tho/features/home/presentation/viewmodels/my_work_view_model.dart';
import 'package:alo_tho/features/home/presentation/widgets/work_listing_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widget_previews.dart';
@Preview(
  group: 'Screens',
  name: 'My Work Page',
  size: phonePreviewSize,
  wrapper: appPreviewWrapper,
)
Widget previewMyWorkPage() => const MyWorkPage();
class MyWorkPage extends ConsumerWidget {
  const MyWorkPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final state = ref.watch(myWorkControllerProvider);
    final controller = ref.read(myWorkControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.myWorkAppBar)),
      body: AppPageBody(
        child: RefreshIndicator(
          onRefresh: controller.load,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: AppSpacing.screenPadding,
            children: [
              SectionHeader(
                title: l10n.myWorkHeadline,
                subtitle: l10n.myWorkSubtitle,
              ),
              const SizedBox(height: AppSpacing.lg),
              if (state.isLoading)
                AppLoadingState(
                  title: l10n.myWorkAppBar,
                  description: l10n.myWorkSubtitle,
                )
              else if (state.errorMessage != null)
                AppErrorView(
                  message: state.errorMessage!,
                  onRetry: controller.load,
                  title: l10n.myWorkAppBar,
                )
              else
                ...state.listings.map(
                  (listing) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: WorkListingCard(listing: listing),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


