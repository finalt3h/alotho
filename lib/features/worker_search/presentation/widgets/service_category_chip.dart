import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/features/worker_search/domain/entities/service_category.dart';
import 'package:flutter/material.dart';

class ServiceCategoryChip extends StatelessWidget {
  const ServiceCategoryChip({
    required this.category,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final ServiceCategory category;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return FilterChip(
      selected: isSelected,
      label: Text(l10n.categoryName(category.name)),
      avatar: Icon(_iconFromName(category.iconName), size: 18),
      onSelected: (_) => onTap(),
    );
  }

  IconData _iconFromName(String iconName) {
    return switch (iconName) {
      'bolt' => Icons.bolt_rounded,
      'water_drop' => Icons.water_drop_rounded,
      'ac_unit' => Icons.ac_unit_rounded,
      'kitchen' => Icons.kitchen_rounded,
      'format_paint' => Icons.format_paint_rounded,
      _ => Icons.handyman_rounded,
    };
  }
}
