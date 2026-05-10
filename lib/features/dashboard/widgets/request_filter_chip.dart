import 'package:flutter/material.dart';
import 'package:vms_app/core/theme/app_theme.dart';

class RequestFilterChip extends StatelessWidget {
  final String label;
  final bool selected;

  const RequestFilterChip({
    super.key,
    required this.label,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: selected ? AppTheme.primary : Colors.white,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: selected ? AppTheme.primary : AppTheme.outlineVariant,
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: selected ? AppTheme.onPrimary : AppTheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
