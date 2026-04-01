import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

/// Constrains screen content so every feature page shares the same readable width.
class AppPageBody extends StatelessWidget {
  const AppPageBody({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
        child: child,
      ),
    );
  }
}
