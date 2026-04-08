import 'package:alo_tho/app/app_routes.dart';
import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/preview/app_preview.dart';
import 'package:alo_tho/core/widgets/app_status_dialog.dart';
import 'package:alo_tho/features/auth/presentation/pages/verify_otp_page.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widget_previews.dart';
import 'package:go_router/go_router.dart';

@Preview(
  group: 'Screens',
  name: 'Register Page',
  size: phonePreviewSize,
  wrapper: appPreviewWrapper,
)
Widget previewRegisterPage() => const RegisterPage();

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    ref.listen(registerControllerProvider, (previous, next) {
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
    });

    final state = ref.watch(registerControllerProvider);
    final controller = ref.read(registerControllerProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xFFF4EFEC),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF4EFEC),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 52,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            onPressed: () => context.go(AppRoutes.loginPath),
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 22,
              color: Color(0xFF5D4B43),
            ),
          ),
        ),
        title: Text(
          l10n.appWordmark,
          style: theme.textTheme.titleMedium?.copyWith(
            color: const Color(0xFFFF6B00),
            fontWeight: FontWeight.w900,
            letterSpacing: 0.6,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.registerTitle,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: const Color(0xFF28211E),
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.6,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  l10n.registerDescription,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF786860),
                    height: 1.45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 18),
                _RegisterFieldLabel(label: l10n.registerRoleLabel),
                const SizedBox(height: 8),
                _RegisterRoleSelector(
                  isWorkerSelected: state.isWorker,
                  onSelectCustomer: () =>
                      controller.updateAccountType(isWorker: false),
                  onSelectWorker: () =>
                      controller.updateAccountType(isWorker: true),
                ),
                const SizedBox(height: 18),
                _RegisterFieldLabel(label: l10n.registerFullNameLabel),
                const SizedBox(height: 8),
                _RegisterTextField(
                  hintText: l10n.registerFullNameHint,
                  prefixIcon: Icons.badge_outlined,
                  onChanged: controller.updateFullName,
                ),
                const SizedBox(height: 14),
                _RegisterFieldLabel(label: l10n.registerPhoneLabel),
                const SizedBox(height: 8),
                _RegisterTextField(
                  hintText: l10n.registerPhoneHint,
                  prefixIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  onChanged: controller.updatePhoneNumber,
                ),
                const SizedBox(height: 14),
                _RegisterFieldLabel(label: l10n.registerEmailLabel),
                const SizedBox(height: 8),
                _RegisterTextField(
                  hintText: l10n.registerEmailHint,
                  prefixIcon: Icons.mail_outline_rounded,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: controller.updateEmail,
                ),
                const SizedBox(height: 14),
                _RegisterFieldLabel(label: l10n.passwordLabel),
                const SizedBox(height: 8),
                _RegisterTextField(
                  hintText: l10n.passwordHint,
                  prefixIcon: Icons.lock_outline_rounded,
                  obscureText: _obscurePassword,
                  onChanged: controller.updatePassword,
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 20,
                      color: const Color(0xFFAC978D),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                _RegisterFieldLabel(label: l10n.registerConfirmPasswordLabel),
                const SizedBox(height: 8),
                _RegisterTextField(
                  hintText: l10n.registerConfirmPasswordHint,
                  prefixIcon: Icons.verified_user_outlined,
                  obscureText: _obscureConfirmPassword,
                  onChanged: controller.updateConfirmPassword,
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 20,
                      color: const Color(0xFFAC978D),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _RegisterPrimaryButton(
                  label: state.isSubmitting
                      ? l10n.processing
                      : l10n.createAccount,
                  onPressed: state.isSubmitting
                      ? null
                      : () async {
                          final submittedEmail = state.email.trim();
                          final result = await controller
                              .registerWithCredentials();
                          if (!context.mounted || result == null) {
                            return;
                          }

                          final successMessage = result.hasActiveSession
                              ? l10n.registerSuccessSignedIn
                              : l10n.registerSuccessVerifyEmail;

                          await showAppStatusDialog(
                            context: context,
                            state: AppStatusDialogState.success,
                            title: appStatusDialogDefaultTitle(
                              context,
                              AppStatusDialogState.success,
                            ),
                            message: successMessage,
                          );

                          if (!context.mounted) {
                            return;
                          }

                          if (!result.hasActiveSession) {
                            await showVerifyOtpBottomSheet(
                              context,
                              identifier: submittedEmail,
                            );
                          }
                        },
                ),
                const SizedBox(height: 14),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF8B7970),
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(text: l10n.registerAgreementPrefix),
                          TextSpan(
                            text: l10n.registerAgreementHighlight,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: const Color(0xFFB24E0D),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextSpan(text: l10n.registerAgreementSuffix),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(
                  height: 1,
                  color: Color(0xFFF0E6E1),
                  thickness: 1,
                ),
                const SizedBox(height: 14),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        l10n.registerExistingAccountPrompt,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF786860),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      TextButton(
                        onPressed: () => context.go(AppRoutes.loginPath),
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFFDB6500),
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          l10n.registerBackToLoginCta,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RegisterRoleSelector extends StatelessWidget {
  const _RegisterRoleSelector({
    required this.isWorkerSelected,
    required this.onSelectCustomer,
    required this.onSelectWorker,
  });

  final bool isWorkerSelected;
  final VoidCallback onSelectCustomer;
  final VoidCallback onSelectWorker;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Row(
      children: [
        Expanded(
          child: _RegisterRoleChip(
            label: l10n.registerRoleCustomerTitle,
            icon: Icons.person_outline_rounded,
            isSelected: !isWorkerSelected,
            onTap: onSelectCustomer,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _RegisterRoleChip(
            label: l10n.registerRoleWorkerTitle,
            icon: Icons.handyman_outlined,
            isSelected: isWorkerSelected,
            onTap: onSelectWorker,
          ),
        ),
      ],
    );
  }
}

class _RegisterRoleChip extends StatelessWidget {
  const _RegisterRoleChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          height: 54,
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFFFF6B00)
                : const Color(0xFFF1EDEC),
            borderRadius: BorderRadius.circular(AppRadius.sm),
            boxShadow: isSelected
                ? const [
                    BoxShadow(
                      color: Color(0x29FF6B00),
                      blurRadius: 18,
                      offset: Offset(0, 8),
                    ),
                  ]
                : const [],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 17,
                color: isSelected ? Colors.white : const Color(0xFF7A6A62),
              ),
              const SizedBox(height: 3),
              Text(
                label,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: isSelected ? Colors.white : const Color(0xFF6E5C54),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterFieldLabel extends StatelessWidget {
  const _RegisterFieldLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: const Color(0xFF7A655B),
        fontWeight: FontWeight.w900,
        letterSpacing: 0.8,
      ),
    );
  }
}

class _RegisterTextField extends StatelessWidget {
  const _RegisterTextField({
    required this.hintText,
    required this.prefixIcon,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.suffix,
  });

  final String hintText;
  final IconData prefixIcon;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: theme.textTheme.bodyLarge?.copyWith(
        color: const Color(0xFF40322D),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.bodyLarge?.copyWith(
          color: const Color(0xFFB7A7A0),
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: Icon(prefixIcon, size: 18, color: const Color(0xFFC2B4AE)),
        suffixIcon: suffix,
        filled: true,
        fillColor: const Color(0xFFF3EFED),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          borderSide: const BorderSide(color: Color(0xFFFF6B00), width: 1.3),
        ),
      ),
    );
  }
}

class _RegisterPrimaryButton extends StatelessWidget {
  const _RegisterPrimaryButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;

    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: enabled
                ? const [Color(0xFFFF7400), Color(0xFFE15C00)]
                : const [Color(0xFFFFC8A4), Color(0xFFF3A979)],
          ),
          boxShadow: enabled
              ? const [
                  BoxShadow(
                    color: Color(0x30E15C00),
                    blurRadius: 18,
                    offset: Offset(0, 10),
                  ),
                ]
              : const [],
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(AppRadius.sm),
          child: SizedBox(
            width: double.infinity,
            height: 54,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    size: 18,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
