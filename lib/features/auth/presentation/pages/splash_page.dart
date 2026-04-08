import 'dart:ui';

import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/preview/app_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

@Preview(
  group: 'Screens',
  name: 'Splash Page',
  size: phonePreviewSize,
  wrapper: appPreviewWrapper,
)
Widget previewSplashPage() => const SplashPage();

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const _backgroundAsset = 'assets/splash/splash_background.png';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final size = MediaQuery.sizeOf(context);
    final topPadding = MediaQuery.paddingOf(context).top;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(_backgroundAsset, fit: BoxFit.cover),
          DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x1AA04100),
                  Color(0x66A04100),
                  Color(0xE5A04100),
                ],
                stops: [0.0, 0.58, 1.0],
              ),
            ),
          ),
          Positioned(
            left: -80,
            bottom: -80,
            child: _GlowOrb(
              size: 256,
              color: const Color(0x4DFF6B00),
              blur: 50,
            ),
          ),
          const Positioned(
            right: -80,
            top: 80,
            child: _GlowOrb(size: 192, color: Color(0x1AFFFFFF), blur: 40),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  SizedBox(height: (size.height * 0.10).clamp(72.0, 112.0)),
                  const _BrandLockup(),
                  const SizedBox(height: 46),
                  _Tagline(tagline: l10n.splashTagline),
                  const Spacer(),
                  _LoadingPill(label: l10n.splashLoadingLabel),
                  const SizedBox(height: 32),
                  Text(
                    l10n.splashFooterLabel.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.55),
                      letterSpacing: 1.6,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: (size.height * 0.05 + topPadding * 0.15).clamp(
                      28.0,
                      52.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BrandLockup extends StatelessWidget {
  const _BrandLockup();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.hero),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40A04100),
              blurRadius: 40,
              offset: Offset(0, 12),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.appWordmark,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: const Color(0xFFA04100),
                  fontSize: AppTextSize.heroLarge,
                  height: 1,
                  letterSpacing: -2.4,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 43,
                height: 43,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF6B00),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.build_rounded,
                  size: 24,
                  color: Color(0xFF5A2500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tagline extends StatelessWidget {
  const _Tagline({required this.tagline});

  final String tagline;

  @override
  Widget build(BuildContext context) {
    final words = tagline.toUpperCase().split(RegExp(r'\s+'));
    final midpoint = (words.length / 2).ceil().clamp(1, words.length);
    final firstLine = words.take(midpoint).join(' ');
    final secondLine = words.skip(midpoint).join(' ');

    return Column(
      children: [
        Opacity(
          opacity: 0.9,
          child: Text(
            secondLine.isEmpty ? firstLine : '$firstLine\n$secondLine',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontSize: AppTextSize.title,
              height: 1.55,
              letterSpacing: 3.6,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: 48,
          height: 4,
          decoration: BoxDecoration(
            color: const Color(0xFFFE9A69),
            borderRadius: BorderRadius.circular(AppRadius.pill),
          ),
        ),
      ],
    );
  }
}

class _LoadingPill extends StatelessWidget {
  const _LoadingPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.pill),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(AppRadius.pill),
            border: Border.all(color: Colors.white.withValues(alpha: 0.20)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x29000000),
                blurRadius: 25,
                offset: Offset(0, 12),
              ),
            ],
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.8,
                    valueColor: const AlwaysStoppedAnimation(Color(0xFFFF6B00)),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.white.withValues(alpha: 0.92),
                    fontSize: AppTextSize.label,
                    letterSpacing: 0.35,
                    fontWeight: FontWeight.w700,
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

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.size, required this.color, required this.blur});

  final double size;
  final Color color;
  final double blur;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: color, blurRadius: blur, spreadRadius: 12),
        ],
      ),
    );
  }
}
