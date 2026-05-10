import 'package:flutter/material.dart';
import 'package:vms_app/core/theme/app_theme.dart';

class DailyTrafficCard extends StatelessWidget {
  final String scheduled;
  final String inBuilding;
  final String expected;

  const DailyTrafficCard({
    super.key,
    required this.scheduled,
    required this.inBuilding,
    required this.expected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Daily Traffic',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppTheme.onPrimary,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            scheduled,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: AppTheme.onPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Scheduled',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      inBuilding,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: AppTheme.onPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'In Building',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      expected,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: AppTheme.onPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Expected',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
