import 'package:alo_tho/app/router.dart';
import 'package:alo_tho/app/providers/app_settings_controller.dart';
import 'package:alo_tho/app/theme/app_theme.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/features/global_config/presentation/widgets/global_config_gate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Root app widget. It wires theme and router in one place.
class AloThoApp extends ConsumerWidget {
  const AloThoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(appLocaleProvider);

    return MaterialApp.router(
      onGenerateTitle: (context) => context.l10n.appTitle,
      debugShowCheckedModeBanner: false,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      themeMode: themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      builder: (context, child) {
        if (child == null) {
          return const SizedBox.shrink();
        }

        return GlobalConfigGate(child: child);
      },
      routerConfig: router,
    );
  }
}
