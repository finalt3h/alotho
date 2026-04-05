import 'package:alo_tho/app/providers/app_settings_controller.dart';
import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/widgets/app_section_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePreferencesCard extends ConsumerWidget {
  const ProfilePreferencesCard({
    required this.title,
    required this.onSignOut,
    required this.isSigningOut,
    super.key,
  });

  final String title;
  final Future<void> Function() onSignOut;
  final bool isSigningOut;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final settingsController = ref.read(appSettingsControllerProvider.notifier);
    final currentLanguageCode =
        ref.watch(appLocaleProvider)?.languageCode ??
        Localizations.localeOf(context).languageCode;

    return AppSectionCard(
      title: title,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.languageLabel),
            subtitle: Text(l10n.languageDescription),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                ChoiceChip(
                  label: Text(l10n.vietnameseLabel),
                  selected: currentLanguageCode == 'vi',
                  onSelected: (_) => settingsController.setVietnamese(),
                ),
                ChoiceChip(
                  label: Text(l10n.englishLabel),
                  selected: currentLanguageCode == 'en',
                  onSelected: (_) => settingsController.setEnglish(),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.themeModeLabel),
            leading: const Icon(Icons.dark_mode_outlined),
            onTap: settingsController.toggleThemeMode,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(isSigningOut ? l10n.processing : l10n.signOut),
            leading: isSigningOut
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: CircularProgressIndicator(strokeWidth: 2.4),
                    ),
                  )
                : const Icon(Icons.logout_rounded),
            onTap: isSigningOut ? null : onSignOut,
          ),
        ],
      ),
    );
  }
}
