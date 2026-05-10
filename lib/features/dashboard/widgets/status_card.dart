import 'package:flutter/material.dart';
import 'package:vms_app/core/theme/app_theme.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData iconData;

  const StatusCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title.toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              Icon(iconData, color: AppTheme.primary, size: 22),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: AppTheme.onSurface,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppTheme.primary),
          ),
        ],
      ),
    );
  }
}
