import 'package:flutter/material.dart';
import 'package:vms_app/core/theme/app_theme.dart';

class StaffCard extends StatelessWidget {
  final String name;
  final String role;
  final String department;
  final String imageUrl;
  final Color statusColor;

  const StaffCard({
    super.key,
    required this.name,
    required this.role,
    required this.department,
    required this.imageUrl,
    this.statusColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.outlineVariant),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: AppTheme.primary.withOpacity(0.1),
                backgroundImage: NetworkImage(imageUrl),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      role.toUpperCase(),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppTheme.primary,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: AppTheme.outlineVariant,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        department,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.onSurfaceVariant,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: AppTheme.onSurfaceVariant,
          ),
        ],
      ),
    );
  }
}
