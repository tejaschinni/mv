import 'package:flutter/material.dart';
import 'package:vms_app/core/theme/app_theme.dart';

enum RequestCardActionType { approveReject, viewDetails, none }

class RequestCard extends StatelessWidget {
  final String initials;
  final String name;
  final String host;
  final String status;
  final Color statusColor;
  final Color statusTextColor;
  final String metadata;
  final String extraDetail;
  final RequestCardActionType actionType;

  const RequestCard({
    super.key,
    required this.initials,
    required this.name,
    required this.host,
    required this.status,
    required this.statusColor,
    required this.statusTextColor,
    required this.metadata,
    required this.extraDetail,
    required this.actionType,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = Colors.red.withOpacity(0.12);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppTheme.primary.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppTheme.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppTheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Host: $host',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  status,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: statusTextColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          if (actionType == RequestCardActionType.approveReject) ...[
            Row(
              children: [
                Icon(Icons.access_time, color: AppTheme.primary, size: 16),
                const SizedBox(width: 8),
                Text(
                  metadata,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.calendar_today_outlined,
                  color: AppTheme.onSurfaceVariant,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    extraDetail,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      foregroundColor: AppTheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Approve'),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppTheme.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      foregroundColor: AppTheme.primary,
                    ),
                    child: const Text('Reject'),
                  ),
                ),
              ],
            ),
          ] else if (actionType == RequestCardActionType.viewDetails) ...[
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        metadata,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        extraDetail,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppTheme.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
                foregroundColor: AppTheme.primary,
              ),
              child: const Text('View Details'),
            ),
          ] else ...[
            Text(
              metadata,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 4),
            if (extraDetail.isNotEmpty)
              Text(
                extraDetail,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.onSurfaceVariant,
                ),
              ),
          ],
        ],
      ),
    );
  }
}
