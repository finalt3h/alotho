import 'dart:async';

import 'package:alo_tho/app/app_routes.dart';
import 'package:alo_tho/app/theme/app_theme.dart';
import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/effects/ui_effect.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/preview/app_preview.dart';
import 'package:alo_tho/core/widgets/app_page_body.dart';
import 'package:alo_tho/core/widgets/app_status_dialog.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_controller.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/auth_session_state.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/otp_verification_state.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/otp_verification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widget_previews.dart';
import 'package:go_router/go_router.dart';

@Preview(
  group: 'Screens',
  name: 'Verify OTP Page',
  size: phonePreviewSize,
  wrapper: appPreviewWrapper,
)
Widget previewVerifyOtpPage() => const VerifyOtpPage(
  identifier: 'worker@example.com',
  presentation: VerifyOtpPresentation.bottomSheet,
);

Future<T?> showVerifyOtpBottomSheet<T>(
  BuildContext context, {
  required String identifier,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => VerifyOtpPage(
      identifier: identifier,
      presentation: VerifyOtpPresentation.bottomSheet,
    ),
  );
}

enum VerifyOtpPresentation { page, bottomSheet }

class VerifyOtpPage extends ConsumerStatefulWidget {
  const VerifyOtpPage({
    required this.identifier,
    this.presentation = VerifyOtpPresentation.page,
    super.key,
  });

  final String identifier;
  final VerifyOtpPresentation presentation;

  @override
  ConsumerState<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends ConsumerState<VerifyOtpPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    ref.listen(otpVerificationUiActionProvider, (_, next) {
      next.whenData((action) {
        unawaited(_handleUiAction(action));
      });
    });

    ref.listen(authSessionControllerProvider.select((state) => state.status), (
      previous,
      next,
    ) {
      if (widget.presentation == VerifyOtpPresentation.bottomSheet &&
          next == AuthStatus.authenticated &&
          previous != next &&
          Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    });

    final theme = Theme.of(context);
    final state = ref.watch(otpVerificationControllerProvider);
    final controller = ref.read(otpVerificationControllerProvider.notifier);
    final isEmail = widget.identifier.contains('@');
    final content = _VerifyOtpContent(
      identifier: widget.identifier,
      isEmail: isEmail,
      theme: theme,
      l10n: l10n,
      state: state,
      onOtpChanged: controller.updateOtp,
      onVerifyPressed: state.isSubmitting
          ? null
          : () async {
              await controller.verifyActivationOtp(
                identifier: widget.identifier,
              );
            },
      onResendPressed: state.isResending
          ? null
          : () async {
              await controller.resendActivationOtp(
                identifier: widget.identifier,
              );
            },
      onBackToLoginPressed: () {
        final router = GoRouter.of(context);
        if (widget.presentation == VerifyOtpPresentation.bottomSheet &&
            Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
        router.go(AppRoutes.loginPath);
      },
    );

    if (widget.presentation == VerifyOtpPresentation.bottomSheet) {
      return _VerifyOtpBottomSheet(title: l10n.verifyOtpTitle, child: content);
    }

    return Scaffold(
      backgroundColor: AppThemeColors.hex0xFFFCF9F8,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(l10n.verifyOtpTitle),
      ),
      body: SafeArea(child: content),
    );
  }

  Future<void> _handleUiAction(UiEffect action) async {
    if (!mounted) {
      return;
    }

    final l10n = context.l10n;
    switch (action) {
      case ShowErrorMessage(:final message):
        await showAppStatusDialog(
          context: context,
          state: AppStatusDialogState.error,
          title: appStatusDialogDefaultTitle(
            context,
            AppStatusDialogState.error,
          ),
          message: l10n.localizeFailureMessage(message),
        );
      case ShowSuccessMessage(:final message):
        await showAppStatusDialog(
          context: context,
          state: AppStatusDialogState.success,
          title: appStatusDialogDefaultTitle(
            context,
            AppStatusDialogState.success,
          ),
          message: l10n.localizeFailureMessage(message),
        );
      case _:
        return;
    }
  }
}

class _VerifyOtpBottomSheet extends StatelessWidget {
  const _VerifyOtpBottomSheet({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SafeArea(
        top: false,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: AppThemeColors.hex0xFFFCF9F8,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppRadius.xxxl),
            ),
            clipBehavior: Clip.antiAlias,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.9,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 44,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppThemeColors.hex0xFFD5C7C0,
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 6, 8, 0),
                    child: Row(
                      children: [
                        const SizedBox(width: 48),
                        Expanded(
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: AppThemeColors.hex0xFF1B1C1C,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.of(context).maybePop(),
                          icon: const Icon(
                            Icons.close_rounded,
                            color: AppThemeColors.hex0xFF7B6B64,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(child: child),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _VerifyOtpContent extends StatelessWidget {
  const _VerifyOtpContent({
    required this.identifier,
    required this.isEmail,
    required this.theme,
    required this.l10n,
    required this.state,
    required this.onOtpChanged,
    required this.onVerifyPressed,
    required this.onResendPressed,
    required this.onBackToLoginPressed,
  });

  final String identifier;
  final bool isEmail;
  final ThemeData theme;
  final AppLocalizations l10n;
  final OtpVerificationState state;
  final ValueChanged<String> onOtpChanged;
  final Future<void> Function()? onVerifyPressed;
  final Future<void> Function()? onResendPressed;
  final VoidCallback onBackToLoginPressed;

  @override
  Widget build(BuildContext context) {
    return AppPageBody(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppRadius.xxxl),
                boxShadow: const [
                  BoxShadow(
                    color: AppThemeColors.hex0x14000000,
                    blurRadius: 18,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                      color: AppThemeColors.hex0x14FF6B00,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.mark_email_unread_outlined,
                      color: AppThemeColors.hex0xFFA04100,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.verifyOtpHeadline,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: AppThemeColors.hex0xFF1B1C1C,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    isEmail
                        ? l10n.verifyOtpDescriptionEmail
                        : l10n.verifyOtpDescriptionPhone,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppThemeColors.hex0xFF5A4136,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppThemeColors.hex0xFFF6F3F2,
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                    child: Text(
                      identifier,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: AppThemeColors.hex0xFF3D2A21,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _OtpFieldLabel(label: l10n.otpLabel),
            const SizedBox(height: 8),
            _OtpTextField(hintText: l10n.otpHint, onChanged: onOtpChanged),
            const SizedBox(height: 16),
            _OtpPrimaryButton(
              label: state.isSubmitting
                  ? l10n.processing
                  : l10n.verifyOtpButton,
              onPressed: onVerifyPressed == null
                  ? null
                  : () => onVerifyPressed!.call(),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: onResendPressed == null
                    ? null
                    : () => onResendPressed!.call(),
                child: Text(
                  state.isResending ? l10n.processing : l10n.resendOtpButton,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: TextButton(
                onPressed: onBackToLoginPressed,
                child: Text(l10n.backToLogin),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OtpFieldLabel extends StatelessWidget {
  const _OtpFieldLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: AppThemeColors.hex0xFF5A4136,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.55,
      ),
    );
  }
}

class _OtpTextField extends StatelessWidget {
  const _OtpTextField({required this.hintText, required this.onChanged});

  final String hintText;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      style: Theme.of(
        context,
      ).textTheme.bodyLarge?.copyWith(color: AppThemeColors.hex0xFF3D2A21),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(color: AppThemeColors.hex0x998E7164),
        prefixIcon: const Icon(
          Icons.password_rounded,
          size: 18,
          color: AppThemeColors.hex0xFF9A7A6D,
        ),
        filled: true,
        fillColor: AppThemeColors.hex0xFFF6F3F2,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.xs),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.xs),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.xs),
          borderSide: const BorderSide(
            color: AppThemeColors.hex0xFFFF6B00,
            width: 1.2,
          ),
        ),
      ),
    );
  }
}

class _OtpPrimaryButton extends StatelessWidget {
  const _OtpPrimaryButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.xs),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppThemeColors.hex0xFFFF6B00,
              AppThemeColors.hex0xFFA04100,
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: AppThemeColors.hex0x33A04100,
              blurRadius: 15,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(AppRadius.xs),
          child: SizedBox(
            width: double.infinity,
            height: 58,
            child: Center(
              child: Text(
                label,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontSize: AppTextSize.title,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
