import 'package:alo_tho/app/theme/app_theme.dart';
import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/preview/app_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

enum AppStatusDialogState { success, error, confirm, alert }

extension AppStatusDialogStateX on AppStatusDialogState {
  bool get showsNegativeAction => this == AppStatusDialogState.confirm;
}

String appStatusDialogDefaultTitle(
  BuildContext context,
  AppStatusDialogState state,
) {
  final l10n = context.l10n;

  return switch (state) {
    AppStatusDialogState.success => l10n.dialogTitleSuccess,
    AppStatusDialogState.error => l10n.dialogTitleError,
    AppStatusDialogState.confirm => l10n.dialogTitleConfirm,
    AppStatusDialogState.alert => l10n.dialogTitleNotice,
  };
}

Future<bool?> showAppStatusDialog({
  required BuildContext context,
  required AppStatusDialogState state,
  required String title,
  required String message,
  String? positiveText,
  String? negativeText,
  VoidCallback? onPositivePressed,
  VoidCallback? onNegativePressed,
  bool barrierDismissible = false,
}) {
  final materialLocalizations = MaterialLocalizations.of(context);

  return showDialog<bool>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (dialogContext) {
      return AppStatusDialog(
        state: state,
        title: title,
        message: message,
        positiveText: positiveText ?? materialLocalizations.okButtonLabel,
        negativeText: negativeText ?? materialLocalizations.cancelButtonLabel,
        onPositivePressed: () {
          Navigator.of(dialogContext).pop(true);
          onPositivePressed?.call();
        },
        onNegativePressed: state.showsNegativeAction
            ? () {
                Navigator.of(dialogContext).pop(false);
                onNegativePressed?.call();
              }
            : null,
      );
    },
  );
}

class AppStatusDialog extends StatelessWidget {
  const AppStatusDialog({
    required this.state,
    required this.title,
    required this.message,
    required this.positiveText,
    this.onPositivePressed,
    this.negativeText,
    this.onNegativePressed,
    super.key,
  }) : assert(
         state != AppStatusDialogState.confirm || negativeText != null,
         'negativeText is required for confirm state.',
       );

  final AppStatusDialogState state;
  final String title;
  final String message;
  final String positiveText;
  final VoidCallback? onPositivePressed;
  final String? negativeText;
  final VoidCallback? onNegativePressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconStyle = _DialogIconStyle.fromState(context, state);

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.lg,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(AppRadius.surface),
            border: Border.all(
              color: theme.colorScheme.outlineVariant.withValues(alpha: 0.45),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 28,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: iconStyle.backgroundColor,
                  borderRadius: BorderRadius.circular(AppRadius.xxl),
                ),
                child: Icon(
                  iconStyle.icon,
                  size: 34,
                  color: iconStyle.iconColor,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                message,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              if (state.showsNegativeAction) ...[
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: onNegativePressed,
                        child: Text(negativeText!),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: FilledButton(
                        onPressed: onPositivePressed,
                        child: Text(positiveText),
                      ),
                    ),
                  ],
                ),
              ] else ...[
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: onPositivePressed,
                    child: Text(positiveText),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _DialogIconStyle {
  const _DialogIconStyle({
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
  });

  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;

  factory _DialogIconStyle.fromState(
    BuildContext context,
    AppStatusDialogState state,
  ) {
    final theme = Theme.of(context);
    final warningColor =
        theme.extension<AppThemeAccent>()?.warning ??
        AppThemeColors.hex0xFFF59E0B;

    return switch (state) {
      AppStatusDialogState.success => _DialogIconStyle(
        icon: Icons.check_circle_rounded,
        backgroundColor: theme.colorScheme.primaryContainer,
        iconColor: theme.colorScheme.primary,
      ),
      AppStatusDialogState.error => _DialogIconStyle(
        icon: Icons.error_rounded,
        backgroundColor: theme.colorScheme.errorContainer,
        iconColor: theme.colorScheme.error,
      ),
      AppStatusDialogState.confirm => _DialogIconStyle(
        icon: Icons.help_rounded,
        backgroundColor: theme.colorScheme.secondaryContainer,
        iconColor: theme.colorScheme.secondary,
      ),
      AppStatusDialogState.alert => _DialogIconStyle(
        icon: Icons.campaign_rounded,
        backgroundColor: warningColor.withValues(alpha: 0.18),
        iconColor: warningColor,
      ),
    };
  }
}

@Preview(
  group: 'Dialog',
  name: 'App Status Dialog',
  size: phonePreviewSize,
  wrapper: appPreviewWrapper,
)
Widget previewAppStatusDialog() {
  return Builder(
    builder: (context) {
      final l10n = context.l10n;
      final materialLocalizations = MaterialLocalizations.of(context);

      return Scaffold(
        backgroundColor: AppThemeColors.hex0x14000000,
        body: Center(
          child: AppStatusDialog(
            state: AppStatusDialogState.confirm,
            title: l10n.dialogPreviewTitle,
            message: l10n.dialogPreviewMessage,
            positiveText: materialLocalizations.okButtonLabel,
            negativeText: materialLocalizations.cancelButtonLabel,
          ),
        ),
      );
    },
  );
}
