import 'package:alo_tho/app/app_routes.dart';
import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/preview/app_preview.dart';
import 'package:alo_tho/core/widgets/app_page_body.dart';
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
  static const _heroAsset = 'assets/login/login_hero.png';
  static const _googleAsset = 'assets/login/google.png';

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
      backgroundColor: const Color(0xFFFCF9F8),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                l10n.alreadyHaveAccountPrompt,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFF5A4136),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 6),
              TextButton(
                onPressed: () => context.go(AppRoutes.loginPath),
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFFA04100),
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  l10n.backToLogin,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: AppPageBody(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => context.go(AppRoutes.loginPath),
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xFF7B6B64),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.handyman_rounded,
                            color: Color(0xFFFF6B00),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              'ALO THỢ',
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: const Color(0xFFFF6B00),
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => _showPlaceholder(context, l10n),
                      tooltip: l10n.loginHelpTooltip,
                      icon: const Icon(
                        Icons.help_outline_rounded,
                        color: Color(0xFF7B6B64),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _RegisterHeroCard(
                  title: l10n.registerTitle,
                  subtitle: l10n.registerDescription,
                  imageAsset: _heroAsset,
                ),
                const SizedBox(height: 18),
                _RegisterFieldLabel(label: l10n.registerFullNameLabel),
                const SizedBox(height: 8),
                _RegisterTextField(
                  hintText: l10n.registerFullNameHint,
                  prefixIcon: Icons.badge_outlined,
                  onChanged: controller.updateFullName,
                ),
                const SizedBox(height: 16),
                _RegisterFieldLabel(label: l10n.registerEmailLabel),
                const SizedBox(height: 8),
                _RegisterTextField(
                  hintText: l10n.registerEmailHint,
                  prefixIcon: Icons.mail_outline_rounded,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: controller.updateEmail,
                ),
                const SizedBox(height: 16),
                _RegisterFieldLabel(label: l10n.registerPhoneLabel),
                const SizedBox(height: 8),
                _RegisterTextField(
                  hintText: l10n.registerPhoneHint,
                  prefixIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  onChanged: controller.updatePhoneNumber,
                ),
                const SizedBox(height: 16),
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
                      color: const Color(0xFF9A7A6D),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
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
                      color: const Color(0xFF9A7A6D),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
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
                const SizedBox(height: 26),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(color: Color(0xFFE4E2E1), thickness: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        l10n.orLabel.toUpperCase(),
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: const Color(0xFF8E7164),
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(color: Color(0xFFE4E2E1), thickness: 1),
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                Row(
                  children: [
                    Expanded(
                      child: _RegisterSocialButton(
                        label: l10n.signInWithGoogle,
                        leading: Image.asset(
                          _googleAsset,
                          width: 20,
                          height: 20,
                        ),
                        onPressed: state.isSubmitting
                            ? null
                            : () async {
                                await controller.loginWithGoogle();
                              },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _RegisterSocialButton(
                        label: l10n.continueWithFacebook,
                        leading: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: Color(0xFF2563EB),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.facebook_rounded,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: state.isSubmitting
                            ? null
                            : () => _showPlaceholder(context, l10n),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showPlaceholder(BuildContext context, AppLocalizations l10n) {
    showAppStatusDialog(
      context: context,
      state: AppStatusDialogState.alert,
      title: appStatusDialogDefaultTitle(context, AppStatusDialogState.alert),
      message: l10n.registerPlaceholder,
    );
  }
}

class _RegisterHeroCard extends StatelessWidget {
  const _RegisterHeroCard({
    required this.title,
    required this.subtitle,
    required this.imageAsset,
  });

  final String title;
  final String subtitle;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 204,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.xxxl),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.xxxl),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(imageAsset, fit: BoxFit.cover),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x08FCF9F8),
                    Color(0x66FCF9F8),
                    Color(0xFFFDF9F8),
                  ],
                  stops: [0.0, 0.56, 1.0],
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 48,
              child: Text(
                title,
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: const Color(0xFF1B1C1C),
                  fontSize: AppTextSize.heroSmall,
                  height: 1.2,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.75,
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Text(
                subtitle,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFF5A4136),
                  fontSize: AppTextSize.body,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
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
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: const Color(0xFF5A4136),
        fontWeight: FontWeight.w800,
        letterSpacing: 0.55,
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
    return TextFormField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: Theme.of(
        context,
      ).textTheme.bodyLarge?.copyWith(color: const Color(0xFF3D2A21)),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(color: const Color(0x998E7164)),
        prefixIcon: Icon(prefixIcon, size: 18, color: const Color(0xFF9A7A6D)),
        suffixIcon: suffix,
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

class _RegisterPrimaryButton extends StatelessWidget {
  const _RegisterPrimaryButton({required this.label, required this.onPressed});

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

class _RegisterSocialButton extends StatelessWidget {
  const _RegisterSocialButton({
    required this.label,
    required this.leading,
    required this.onPressed,
  });

  final String label;
  final Widget leading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(54),
        backgroundColor: Colors.white,
        side: const BorderSide(color: Color(0x4DE2BFB0)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.xs),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leading,
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: const Color(0xFF1B1C1C),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
