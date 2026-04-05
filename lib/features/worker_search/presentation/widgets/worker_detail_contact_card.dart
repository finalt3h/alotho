import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/widgets/app_section_card.dart';
import 'package:alo_tho/core/widgets/app_status_dialog.dart';
import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';
import 'package:flutter/material.dart';

class WorkerDetailContactCard extends StatelessWidget {
  const WorkerDetailContactCard({required this.worker, super.key});

  final Worker worker;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppSectionCard(
      title: l10n.contactNowWithPrice(worker.priceDescription),
      subtitle: l10n.workerContactPlaceholder,
      child: FilledButton.icon(
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
        icon: const Icon(Icons.call_outlined),
        label: Text(l10n.details),
      ),
    );
  }
}
