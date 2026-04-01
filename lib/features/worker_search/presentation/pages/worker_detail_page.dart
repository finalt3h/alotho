import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/widgets/app_error_view.dart';
import 'package:alo_tho/core/widgets/app_loading_state.dart';
import 'package:alo_tho/core/widgets/app_page_body.dart';
import 'package:alo_tho/features/worker_search/presentation/viewmodels/worker_detail_view_model.dart';
import 'package:alo_tho/features/worker_search/presentation/widgets/worker_detail_contact_card.dart';
import 'package:alo_tho/features/worker_search/presentation/widgets/worker_detail_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkerDetailPage extends ConsumerWidget {
  const WorkerDetailPage({required this.workerId, super.key});

  final String workerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final state = ref.watch(workerDetailControllerProvider(workerId));
    final controller = ref.read(
      workerDetailControllerProvider(workerId).notifier,
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.workerDetailTitle)),
      body: AppPageBody(
        child: state.isLoading
            ? AppLoadingState(
                title: l10n.workerDetailTitle,
                description: l10n.workerSearchSubtitle,
              )
            : state.errorMessage != null
            ? AppErrorView(
                message: state.errorMessage!,
                onRetry: controller.load,
                title: l10n.workerDetailTitle,
              )
            : ListView(
                padding: AppSpacing.screenPadding,
                children: [
                  WorkerDetailSummaryCard(worker: state.worker!),
                  const SizedBox(height: AppSpacing.md),
                  WorkerDetailContactCard(worker: state.worker!),
                ],
              ),
      ),
    );
  }
}
