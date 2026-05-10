import 'package:flutter/material.dart';
import 'package:vms_app/core/theme/app_theme.dart';
import 'package:vms_app/core/utils/app_sizes.dart';
import 'package:vms_app/features/dashboard/widgets/action_card.dart';
import 'package:vms_app/features/dashboard/widgets/live_feed_card.dart';
import 'package:vms_app/features/dashboard/widgets/logs_section.dart';
import 'package:vms_app/features/dashboard/widgets/status_card.dart';
import 'package:vms_app/features/dashboard/widgets/system_status_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 720;
        final contentPadding = EdgeInsets.symmetric(
          horizontal: isWide
              ? AppSizes.wideScreenPadding
              : AppSizes.screenPadding,
          vertical: AppSizes.screenPadding,
        );
        final cardWidth = isWide
            ? (constraints.maxWidth - 72) / 2
            : double.infinity;

        return SingleChildScrollView(
          padding: contentPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Operations Overview',
                style: theme.textTheme.headlineLarge?.copyWith(
                  color: AppTheme.onSurface,
                ),
              ),
              const SizedBox(height: AppSizes.smallSpacing),
              Text(
                'Real-time monitoring for Tuesday, October 24',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSizes.sectionSpacing),
              Wrap(
                spacing: AppSizes.cardSpacing,
                runSpacing: AppSizes.cardSpacing,
                children: [
                  SizedBox(
                    width: cardWidth,
                    child: const StatusCard(
                      title: 'Active Meetings',
                      value: '12',
                      subtitle: '+2 from last hour',
                      iconData: Icons.calendar_today_outlined,
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: const StatusCard(
                      title: 'Pending Approvals',
                      value: '07',
                      subtitle: '! 3 critical overrides',
                      iconData: Icons.assignment_turned_in_outlined,
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: const SystemStatusCard(
                      title: 'System Status',
                      statusLabel: 'Secure',
                      description: 'All nodes operational',
                      iconData: Icons.shield_outlined,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.largeSpacing),
              Text(
                'Quick Actions',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: AppTheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppSizes.mediumSpacing),
              Wrap(
                spacing: AppSizes.mediumSpacing,
                runSpacing: AppSizes.mediumSpacing,
                children: const [
                  ActionCard(
                    label: 'Gen Report',
                    iconData: Icons.description_outlined,
                  ),
                  ActionCard(
                    label: 'Geofence',
                    iconData: Icons.grid_view_outlined,
                  ),
                  ActionCard(
                    label: 'Add Staff',
                    iconData: Icons.person_add_alt_1_outlined,
                  ),
                  ActionCard(
                    label: 'Override',
                    iconData: Icons.power_settings_new_outlined,
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.largeSpacing),
              const LogsHeader(),
              const SizedBox(height: AppSizes.mediumSpacing),
              const OperationLogsCard(),
              const SizedBox(height: AppSizes.sectionSpacing),
              LiveFeedCard(isWide: isWide),
              const SizedBox(height: AppSizes.sectionSpacing),
            ],
          ),
        );
      },
    );
  }
}
