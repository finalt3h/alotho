import 'package:flutter/material.dart';

class AuthMethodButton extends StatelessWidget {
  const AuthMethodButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    this.isPrimary = false,
    super.key,
  });

  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 22),
        const SizedBox(width: 12),
        Flexible(child: Text(label, textAlign: TextAlign.center)),
      ],
    );

    if (isPrimary) {
      return SizedBox(
        width: double.infinity,
        child: FilledButton(onPressed: onPressed, child: child),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(onPressed: onPressed, child: child),
    );
  }
}
