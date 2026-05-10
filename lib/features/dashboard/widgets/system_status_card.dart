import 'package:flutter/material.dart';
import 'package:vms_app/core/theme/app_theme.dart';

class SystemStatusCard extends StatelessWidget {
  final String title;
  final String statusLabel;
  final String description;
  final IconData iconData;

  const SystemStatusCard({
    super.key,
    required this.title,
    required this.statusLabel,
    required this.description,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(18),
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
                    color: AppTheme.onPrimary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              Icon(iconData, color: AppTheme.onPrimary, size: 22),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            statusLabel.toUpperCase(),
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: AppTheme.onPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppTheme.onPrimary),
          ),
        ],
      ),
    );
  }
}
