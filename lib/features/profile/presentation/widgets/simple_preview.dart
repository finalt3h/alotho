import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/preview/app_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

@Preview(name: 'Simple Text', wrapper: appPreviewWrapper)
Widget previewSimpleText() {
  return Builder(
    builder: (context) => Center(child: Text(context.l10n.simplePreviewText)),
  );
}
