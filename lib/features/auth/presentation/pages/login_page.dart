import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/preview/app_preview.dart';
import 'package:alo_tho/core/widgets/app_page_body.dart';
import 'package:alo_tho/core/widgets/app_section_card.dart';
import 'package:alo_tho/features/auth/presentation/viewmodels/login_view_model.dart';
import 'package:alo_tho/features/auth/presentation/widgets/auth_method_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widget_previews.dart';

@Preview(
  group: 'Screens',
  name: 'Login Page',
  size: phonePreviewSize,
  wrapper: appPreviewWrapper,
)
Widget previewLoginPage() => const LoginPage();
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    ref.listen(loginControllerProvider, (previous, next) {
      if (next.errorMessage != null &&
          next.errorMessage != previous?.errorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.localizeFailureMessage(next.errorMessage!)),
          ),
        );
      }
    });

    final theme = Theme.of(context);
    final state = ref.watch(loginControllerProvider);
    final controller = ref.read(loginControllerProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: AppPageBody(
          child: SingleChildScrollView(
            padding: AppSpacing.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Icon(
                    Icons.phone_android_rounded,
                    color: theme.colorScheme.primary,
                    size: 34,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  l10n.loginTitle,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  l10n.loginDescription,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: controller.updateIdentifier,
                  decoration: InputDecoration(
                    labelText: l10n.loginIdentifierLabel,
                    hintText: l10n.loginIdentifierHint,
                    prefixIcon: const Icon(Icons.alternate_email_rounded),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                TextFormField(
                  obscureText: true,
                  onChanged: controller.updatePassword,
                  decoration: InputDecoration(
                    labelText: l10n.passwordLabel,
                    hintText: l10n.passwordHint,
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: state.isSubmitting
                        ? null
                        : () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(l10n.forgotPasswordPlaceholder),
                              ),
                            );
                          },
                    child: Text(l10n.forgotPassword),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                AuthMethodButton(
                  label: state.isSubmitting
                      ? l10n.processing
                      : l10n.signInWithCredentials,
                  icon: Icons.login_rounded,
                  isPrimary: true,
                  onPressed: state.isSubmitting
                      ? null
                      : () async {
                          await controller.loginWithCredentials();
                        },
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: theme.colorScheme.outlineVariant),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                      ),
                      child: Text(l10n.orLabel),
                    ),
                    Expanded(
                      child: Divider(color: theme.colorScheme.outlineVariant),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                AuthMethodButton(
                  label: l10n.signInWithGoogle,
                  icon: Icons.g_mobiledata_rounded,
                  onPressed: state.isSubmitting
                      ? null
                      : () async {
                          await controller.loginWithGoogle();
                        },
                ),
                const SizedBox(height: AppSpacing.xl),
                AppSectionCard(
                  title: l10n.loginBenefitTitle,
                  child: Text(l10n.loginBenefitDescription),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


