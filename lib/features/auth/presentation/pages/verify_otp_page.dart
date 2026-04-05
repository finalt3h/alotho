import 'package:alo_tho/app/app_routes.dart';
import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/preview/app_preview.dart';
import 'package:alo_tho/core/widgets/app_page_body.dart';
import 'package:alo_tho/core/widgets/app_status_dialog.dart';
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
Widget previewVerifyOtpPage() =>
    const VerifyOtpPage(identifier: 'worker@example.com');

class VerifyOtpPage extends ConsumerStatefulWidget {
  const VerifyOtpPage({required this.identifier, super.key});

  final String identifier;

  @override
  ConsumerState<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends ConsumerState<VerifyOtpPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    ref.listen(otpVerificationControllerProvider, (previous, next) {
      if (next.errorMessage != null &&
          next.errorMessage != previous?.errorMessage) {
        showAppStatusDialog(
          context: context,
          state: AppStatusDialogState.error,
          title: appStatusDialogDefaultTitle(
            context,
            AppStatusDialogState.error,
          ),
          message: l10n.localizeFailureMessage(next.errorMessage!),
        );
      }

      if (next.infoMessage != null &&
          next.infoMessage != previous?.infoMessage) {
        showAppStatusDialog(
          context: context,
          state: AppStatusDialogState.success,
          title: appStatusDialogDefaultTitle(
            context,
            AppStatusDialogState.success,
          ),
          message: l10n.localizeFailureMessage(next.infoMessage!),
        );
      }
    });

    final theme = Theme.of(context);
    final state = ref.watch(otpVerificationControllerProvider);
    final controller = ref.read(otpVerificationControllerProvider.notifier);
    final isEmail = widget.identifier.contains('@');

    return Scaffold(
      backgroundColor: const Color(0xFFFCF9F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(l10n.verifyOtpTitle),
      ),
      body: SafeArea(
        child: AppPageBody(
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
                        color: Color(0x14000000),
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
                          color: Color(0x14FF6B00),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.mark_email_unread_outlined,
                          color: Color(0xFFA04100),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n.verifyOtpHeadline,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: const Color(0xFF1B1C1C),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        isEmail
                            ? l10n.verifyOtpDescriptionEmail
                            : l10n.verifyOtpDescriptionPhone,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFF5A4136),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6F3F2),
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                        ),
                        child: Text(
                          widget.identifier,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: const Color(0xFF3D2A21),
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
                _OtpTextField(
                  hintText: l10n.otpHint,
                  onChanged: controller.updateOtp,
                ),
                const SizedBox(height: 16),
                _OtpPrimaryButton(
                  label: state.isSubmitting
                      ? l10n.processing
                      : l10n.verifyOtpButton,
                  onPressed: state.isSubmitting
                      ? null
                      : () async {
                          await controller.verifyActivationOtp(
                            identifier: widget.identifier,
                          );
                        },
                ),
                const SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: state.isResending
                        ? null
                        : () async {
                            await controller.resendActivationOtp(
                              identifier: widget.identifier,
                            );
                          },
                    child: Text(
                      state.isResending
                          ? l10n.processing
                          : l10n.resendOtpButton,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: TextButton(
                    onPressed: () => context.go(AppRoutes.loginPath),
                    child: Text(l10n.backToLogin),
                  ),
                ),
              ],
            ),
          ),
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
        color: const Color(0xFF5A4136),
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
      ).textTheme.bodyLarge?.copyWith(color: const Color(0xFF3D2A21)),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(color: const Color(0x998E7164)),
        prefixIcon: const Icon(
          Icons.password_rounded,
          size: 18,
          color: Color(0xFF9A7A6D),
        ),
        filled: true,
        fillColor: const Color(0xFFF6F3F2),
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
          borderSide: const BorderSide(color: Color(0xFFFF6B00), width: 1.2),
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
            colors: [Color(0xFFFF6B00), Color(0xFFA04100)],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33A04100),
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
