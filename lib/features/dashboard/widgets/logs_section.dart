import 'package:flutter/material.dart';
import 'package:vms_app/core/theme/app_theme.dart';

class LogsHeader extends StatelessWidget {
  const LogsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            'Operational Logs',
            style: theme.textTheme.titleMedium?.copyWith(
              color: AppTheme.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'VIEW ALL',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppTheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class OperationLogsCard extends StatelessWidget {
  const OperationLogsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.outlineVariant),
      ),
      child: const Column(
        children: [
          OperationLogItem(
            title: 'Main Entry Geofence Triggered',
            subtitle: 'Badge: 9982 • 14:22:10',
            dotColor: Colors.red,
          ),
          OperationLogItem(
            title: 'Unauthorized Server Access',
            subtitle: 'Rack-04 • 13:45:02',
            dotColor: Colors.red,
          ),
          OperationLogItem(
            title: 'System Backup Completed',
            subtitle: 'Cloud Node B • 13:00:00',
            dotColor: Colors.brown,
          ),
        ],
      ),
    );
  }
}

class OperationLogItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color dotColor;

  const OperationLogItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.dotColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppTheme.onSurfaceVariant),
            ],
          ),
        ),
        const Divider(height: 1, indent: 18, endIndent: 18),
      ],
    );
  }
}
