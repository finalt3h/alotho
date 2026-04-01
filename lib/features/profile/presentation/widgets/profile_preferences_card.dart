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
    super.key,
  });

  final String title;
  final VoidCallback onSignOut;

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
            title: Text(l10n.signOut),
            leading: const Icon(Icons.logout_rounded),
            onTap: onSignOut,
          ),
        ],
      ),
    );
  }
}
