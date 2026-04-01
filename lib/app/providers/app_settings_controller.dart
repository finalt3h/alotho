import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Keeps app-wide UI preferences in one provider so theme and locale stay in sync.
class AppSettings {
  const AppSettings({this.themeMode = ThemeMode.system, this.locale});

  final ThemeMode themeMode;
  final Locale? locale;

  AppSettings copyWith({ThemeMode? themeMode, Locale? locale}) {
    return AppSettings(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }
}

final appSettingsControllerProvider =
    NotifierProvider<AppSettingsController, AppSettings>(
      AppSettingsController.new,
    );

final themeModeProvider = Provider<ThemeMode>((ref) {
  return ref.watch(appSettingsControllerProvider).themeMode;
});

final appLocaleProvider = Provider<Locale?>((ref) {
  return ref.watch(appSettingsControllerProvider).locale;
});

class AppSettingsController extends Notifier<AppSettings> {
  @override
  AppSettings build() => const AppSettings();

  void toggleThemeMode() {
    state = state.copyWith(
      themeMode: switch (state.themeMode) {
        ThemeMode.light => ThemeMode.dark,
        ThemeMode.dark => ThemeMode.light,
        ThemeMode.system => ThemeMode.light,
      },
    );
  }

  void setVietnamese() {
    state = state.copyWith(locale: const Locale('vi'));
  }

  void setEnglish() {
    state = state.copyWith(locale: const Locale('en'));
  }
}
