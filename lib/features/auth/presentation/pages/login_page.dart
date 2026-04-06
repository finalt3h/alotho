import 'package:alo_tho/app/app_routes.dart';
import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/preview/app_preview.dart';
import 'package:alo_tho/core/widgets/app_page_body.dart';
import 'package:alo_tho/core/widgets/app_status_dialog.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widget_previews.dart';
import 'package:go_router/go_router.dart';

@Preview(
  group: 'Screens',
  name: 'Login Page',
  size: phonePreviewSize,
  wrapper: appPreviewWrapper,
)
Widget previewLoginPage() => const LoginPage();

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  static const _heroAsset = 'assets/login/login_hero.png';
  static const _googleAsset = 'assets/login/google.png';

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    ref.listen(loginControllerProvider, (previous, next) {
      if (next.pendingActivationIdentifier != null &&
          next.pendingActivationIdentifier !=
              previous?.pendingActivationIdentifier) {
        final identifier = next.pendingActivationIdentifier!;
        final message = l10n.localizeFailureMessage(next.errorMessage ?? '');

        ref.read(loginControllerProvider.notifier).clearPendingActivation();

        showAppStatusDialog(
          context: context,
          state: AppStatusDialogState.alert,
          title: appStatusDialogDefaultTitle(
            context,
            AppStatusDialogState.alert,
          ),
          message: message,
          onPositivePressed: () {
            if (!context.mounted) {
              return;
            }
            context.go(
              '${AppRoutes.verifyOtpPath}?identifier=${Uri.encodeComponent(identifier)}',
            );
          },
        );
        return;
      }

      if (next.errorMessage != null) {
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

    final theme = Theme.of(context);
    final state = ref.watch(loginControllerProvider);
    final controller = ref.read(loginControllerProvider.notifier);

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
                l10n.noAccountPrompt,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFF5A4136),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 6),
              TextButton(
                onPressed: () => context.go(AppRoutes.registerPath),
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFFA04100),
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  l10n.registerNow,
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
                    Icon(
                      Icons.handyman_rounded,
                      color: const Color(0xFFFF6B00),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'ALO THỢ',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: const Color(0xFFFF6B00),
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                      ),
                    ),
                    const Spacer(),
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
                _LoginHeroCard(
                  title: l10n.loginTitle,
                  subtitle: l10n.loginDescription,
                  imageAsset: _heroAsset,
                ),
                const SizedBox(height: 18),
                _LoginFieldLabel(label: l10n.loginIdentifierLabel),
                const SizedBox(height: 8),
                _LoginTextField(
                  hintText: l10n.loginIdentifierHint,
                  prefixIcon: Icons.person_outline_rounded,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: controller.updateIdentifier,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _LoginFieldLabel(label: l10n.passwordLabel),
                    ),
                    TextButton(
                      onPressed: state.isSubmitting
                          ? null
                          : () => _showForgotPasswordPlaceholder(context, l10n),
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFFA04100),
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        l10n.forgotPassword.toUpperCase(),
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.55,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _LoginTextField(
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
                _PrimaryLoginButton(
                  label: state.isSubmitting
                      ? l10n.processing
                      : l10n.signInWithCredentials,
                  onPressed: state.isSubmitting
                      ? null
                      : () async {
                          await controller.loginWithCredentials();
                        },
                ),
                const SizedBox(height: 26),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: const Color(0xFFE4E2E1),
                        thickness: 1,
                      ),
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
                    Expanded(
                      child: Divider(
                        color: const Color(0xFFE4E2E1),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                Row(
                  children: [
                    Expanded(
                      child: _SocialLoginButton(
                        label: l10n.signInWithGoogle,
                        onPressed: state.isSubmitting
                            ? null
                            : () async {
                                await controller.loginWithGoogle();
                              },
                        leading: Image.asset(
                          _googleAsset,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _SocialLoginButton(
                        label: l10n.continueWithFacebook,
                        onPressed: state.isSubmitting
                            ? null
                            : () => _showPlaceholder(context, l10n),
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

  void _showForgotPasswordPlaceholder(
    BuildContext context,
    AppLocalizations l10n,
  ) {
    showAppStatusDialog(
      context: context,
      state: AppStatusDialogState.alert,
      title: appStatusDialogDefaultTitle(context, AppStatusDialogState.alert),
      message: l10n.forgotPasswordPlaceholder,
    );
  }

  void _showPlaceholder(BuildContext context, AppLocalizations l10n) {
    showAppStatusDialog(
      context: context,
      state: AppStatusDialogState.alert,
      title: appStatusDialogDefaultTitle(context, AppStatusDialogState.alert),
      message: l10n.authActionPlaceholder,
    );
  }
}

class _LoginHeroCard extends StatelessWidget {
  const _LoginHeroCard({
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
      height: 192,
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
                    Color(0x00FCF9F8),
                    Color(0x66FCF9F8),
                    Color(0xFFFCF9F8),
                  ],
                  stops: [0.0, 0.58, 1.0],
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: const Color(0xFF1B1C1C),
                      fontSize: AppTextSize.heroMedium,
                      height: 1.2,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.75,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFF5A4136),
                      fontSize: AppTextSize.body,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginFieldLabel extends StatelessWidget {
  const _LoginFieldLabel({required this.label});

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

class _LoginTextField extends StatelessWidget {
  const _LoginTextField({
    required this.hintText,
    required this.prefixIcon,
    required this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.suffix,
  });

  final String hintText;
  final IconData prefixIcon;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
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

class _PrimaryLoginButton extends StatelessWidget {
  const _PrimaryLoginButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final disabled = onPressed == null;

    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.xs),
          gradient: disabled
              ? null
              : const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFFF6B00), Color(0xFFA04100)],
                ),
          color: disabled ? const Color(0xFFFFB98A) : null,
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

class _SocialLoginButton extends StatelessWidget {
  const _SocialLoginButton({
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
