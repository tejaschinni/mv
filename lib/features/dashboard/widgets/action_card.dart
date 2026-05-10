import 'package:flutter/material.dart';
import 'package:vms_app/core/theme/app_theme.dart';

class ActionCard extends StatelessWidget {
  final String label;
  final IconData iconData;

  const ActionCard({super.key, required this.label, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 158,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 22),
          side: BorderSide(color: AppTheme.outlineVariant),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          foregroundColor: AppTheme.primary,
          backgroundColor: Colors.white,
        ),
        child: Column(
          children: [
            Icon(iconData, size: 26, color: AppTheme.primary),
            const SizedBox(height: 10),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppTheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
