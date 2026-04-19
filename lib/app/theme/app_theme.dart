import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class AppThemeColors {
  AppThemeColors._();

  static const hex0x00FCF9F8 = Color(0x00FCF9F8);
  static const hex0x0DA04100 = Color(0x0DA04100);
  static const hex0x14000000 = Color(0x14000000);
  static const hex0x14FF6B00 = Color(0x14FF6B00);
  static const hex0x1AA04100 = Color(0x1AA04100);
  static const hex0x1AFFFFFF = Color(0x1AFFFFFF);
  static const hex0x29000000 = Color(0x29000000);
  static const hex0x29FF6B00 = Color(0x29FF6B00);
  static const hex0x30E15C00 = Color(0x30E15C00);
  static const hex0x33A04100 = Color(0x33A04100);
  static const hex0x33E2BFB0 = Color(0x33E2BFB0);
  static const hex0x33FE9A69 = Color(0x33FE9A69);
  static const hex0x40A04100 = Color(0x40A04100);
  static const hex0x4DE2BFB0 = Color(0x4DE2BFB0);
  static const hex0x4DFE9A69 = Color(0x4DFE9A69);
  static const hex0x4DFF6B00 = Color(0x4DFF6B00);
  static const hex0x66A04100 = Color(0x66A04100);
  static const hex0x66FCF9F8 = Color(0x66FCF9F8);
  static const hex0x998E7164 = Color(0x998E7164);
  static const hex0xE5A04100 = Color(0xE5A04100);
  static const hex0xE6FCF9F8 = Color(0xE6FCF9F8);
  static const hex0xFF0062A1 = Color(0xFF0062A1);
  static const hex0xFF0E1726 = Color(0xFF0E1726);
  static const hex0xFF15803D = Color(0xFF15803D);
  static const hex0xFF1B1C1C = Color(0xFF1B1C1C);
  static const hex0xFF2563EB = Color(0xFF2563EB);
  static const hex0xFF28211E = Color(0xFF28211E);
  static const hex0xFF3D2A21 = Color(0xFF3D2A21);
  static const hex0xFF40322D = Color(0xFF40322D);
  static const hex0xFF5A2500 = Color(0xFF5A2500);
  static const hex0xFF5A4136 = Color(0xFF5A4136);
  static const hex0xFF5D4B43 = Color(0xFF5D4B43);
  static const hex0xFF6E5C54 = Color(0xFF6E5C54);
  static const hex0xFF763006 = Color(0xFF763006);
  static const hex0xFF786860 = Color(0xFF786860);
  static const hex0xFF7A655B = Color(0xFF7A655B);
  static const hex0xFF7A6A62 = Color(0xFF7A6A62);
  static const hex0xFF7B6B64 = Color(0xFF7B6B64);
  static const hex0xFF8B7970 = Color(0xFF8B7970);
  static const hex0xFF8E7164 = Color(0xFF8E7164);
  static const hex0xFF9A7A6D = Color(0xFF9A7A6D);
  static const hex0xFFA04100 = Color(0xFFA04100);
  static const hex0xFFAC978D = Color(0xFFAC978D);
  static const hex0xFFAD5C33 = Color(0xFFAD5C33);
  static const hex0xFFB24E0D = Color(0xFFB24E0D);
  static const hex0xFFB7A7A0 = Color(0xFFB7A7A0);
  static const hex0xFFC2B4AE = Color(0xFFC2B4AE);
  static const hex0xFFD5C7C0 = Color(0xFFD5C7C0);
  static const hex0xFFDB6500 = Color(0xFFDB6500);
  static const hex0xFFDCFCE7 = Color(0xFFDCFCE7);
  static const hex0xFFE15C00 = Color(0xFFE15C00);
  static const hex0xFFE4E2E1 = Color(0xFFE4E2E1);
  static const hex0xFFF0E6E1 = Color(0xFFF0E6E1);
  static const hex0xFFF1D2C1 = Color(0xFFF1D2C1);
  static const hex0xFFF1EDEC = Color(0xFFF1EDEC);
  static const hex0xFFF3A979 = Color(0xFFF3A979);
  static const hex0xFFF3B400 = Color(0xFFF3B400);
  static const hex0xFFF3EFED = Color(0xFFF3EFED);
  static const hex0xFFF4EFEC = Color(0xFFF4EFEC);
  static const hex0xFFF4F6F8 = Color(0xFFF4F6F8);
  static const hex0xFFF59E0B = Color(0xFFF59E0B);
  static const hex0xFFF5E9E2 = Color(0xFFF5E9E2);
  static const hex0xFFF6F3F2 = Color(0xFFF6F3F2);
  static const hex0xFFFCF9F8 = Color(0xFFFCF9F8);
  static const hex0xFFFE9A69 = Color(0xFFFE9A69);
  static const hex0xFFFF6B00 = Color(0xFFFF6B00);
  static const hex0xFFFF7400 = Color(0xFFFF7400);
  static const hex0xFFFFB98A = Color(0xFFFFB98A);
  static const hex0xFFFFC8A4 = Color(0xFFFFC8A4);
}

class AppTheme {
  AppTheme._();

  static const _seedColor = AppThemeColors.hex0xFFFF6B00;
  static const _accentColor = AppThemeColors.hex0xFFF59E0B;

  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.light,
      surface: AppThemeColors.hex0xFFF4F6F8,
    );

    return _buildTheme(colorScheme);
  }

  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
      surface: AppThemeColors.hex0xFF0E1726,
    );

    return _buildTheme(colorScheme);
  }

  static ThemeData _buildTheme(ColorScheme colorScheme) {
    final baseTextTheme = Typography.material2021().black.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );

    final textTheme = baseTextTheme.copyWith(
      headlineMedium: baseTextTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.w800,
        letterSpacing: -0.8,
      ),
      headlineSmall: baseTextTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w800,
        letterSpacing: -0.6,
      ),
      titleLarge: baseTextTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w800,
        letterSpacing: -0.3,
      ),
      titleMedium: baseTextTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(height: 1.45),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(height: 1.45),
      labelLarge: baseTextTheme.labelLarge?.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: colorScheme.surface,
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant.withValues(alpha: 0.8),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: TextStyle(color: colorScheme.onInverseSurface),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: colorScheme.surface.withValues(alpha: 0.92),
        foregroundColor: colorScheme.onSurface,
        scrolledUnderElevation: 0,
        elevation: 0,
        titleTextStyle: textTheme.titleLarge,
      ),
      cardTheme: CardThemeData(
        elevation: 10,
        color: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.surface),
          side: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: 0.45),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(56),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(56),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          side: BorderSide(color: colorScheme.outlineVariant),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceContainerLowest,
        selectedColor: colorScheme.primaryContainer,
        side: BorderSide(color: colorScheme.outlineVariant),
        labelStyle: textTheme.labelLarge,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.4),
        ),
        prefixIconColor: colorScheme.primary,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface.withValues(alpha: 0.96),
        indicatorColor: colorScheme.primaryContainer,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          return textTheme.labelMedium?.copyWith(
            fontWeight: states.contains(WidgetState.selected)
                ? FontWeight.w800
                : FontWeight.w600,
          );
        }),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.xl),
        ),
      ),
      extensions: [AppThemeAccent(_accentColor)],
    );
  }
}

class AppThemeAccent extends ThemeExtension<AppThemeAccent> {
  const AppThemeAccent(this.warning);

  final Color warning;

  @override
  ThemeExtension<AppThemeAccent> copyWith({Color? warning}) {
    return AppThemeAccent(warning ?? this.warning);
  }

  @override
  ThemeExtension<AppThemeAccent> lerp(
    covariant ThemeExtension<AppThemeAccent>? other,
    double t,
  ) {
    if (other is! AppThemeAccent) {
      return this;
    }

    return AppThemeAccent(Color.lerp(warning, other.warning, t) ?? warning);
  }
}
