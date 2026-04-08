import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/preview/app_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class CommonView extends StatelessWidget {
  final String title;

  const CommonView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Text(title, style: const TextStyle(fontSize: AppTextSize.body)),
    );
  }
}

@Preview(name: 'CommonView Default', wrapper: appPreviewWrapper)
Widget previewCommonView() {
  return Builder(
    builder: (context) => Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: CommonView(title: context.l10n.commonViewPreviewTitle),
      ),
    ),
  );
}
