import 'package:flutter/material.dart';
import 'package:vms_app/core/theme/app_theme.dart';
import 'package:vms_app/core/utils/app_sizes.dart';
import 'package:vms_app/features/dashboard/widgets/daily_traffic_card.dart';
import 'package:vms_app/features/dashboard/widgets/request_card.dart';
import 'package:vms_app/features/dashboard/widgets/request_filter_chip.dart';
import 'package:vms_app/features/dashboard/widgets/search_input.dart';

class AppointmentRequestsScreen extends StatelessWidget {
  const AppointmentRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final padding = EdgeInsets.symmetric(
          horizontal: maxWidth >= 720
              ? AppSizes.wideScreenPadding
              : AppSizes.screenPadding,
          vertical: AppSizes.sectionSpacing - 6,
        );

        return SingleChildScrollView(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SearchInput(),
              const SizedBox(height: AppSizes.mediumSpacing),
              Wrap(
                spacing: AppSizes.smallSpacing + 4,
                runSpacing: AppSizes.smallSpacing + 4,
                children: const [
                  RequestFilterChip(label: 'All Requests', selected: true),
                  RequestFilterChip(label: 'Pending'),
                  RequestFilterChip(label: 'Approved'),
                ],
              ),
              const SizedBox(height: AppSizes.sectionSpacing),
              RequestCard(
                initials: 'JS',
                name: 'Jonathan Smith',
                host: 'Sarah Jenkins',
                status: 'PENDING',
                statusColor: AppTheme.primary.withOpacity(0.15),
                statusTextColor: AppTheme.primary,
                metadata: '10:30 AM - 11:15 AM',
                extraDetail: 'Oct 24, 2023',
                actionType: RequestCardActionType.approveReject,
              ),
              const SizedBox(height: AppSizes.mediumSpacing),
              RequestCard(
                initials: 'RW',
                name: 'Rebecca White',
                host: 'David Chen',
                status: 'PENDING',
                statusColor: Colors.red.withOpacity(0.12),
                statusTextColor: AppTheme.primary,
                metadata: '2:00 PM - 3:00 PM',
                extraDetail: 'Boardroom A',
                actionType: RequestCardActionType.approveReject,
              ),
              const SizedBox(height: AppSizes.mediumSpacing),
              RequestCard(
                initials: 'AM',
                name: 'Alex Miller',
                host: 'Sarah Jenkins',
                status: 'APPROVED',
                statusColor: const Color(0xFFDFF7E6),
                statusTextColor: const Color(0xFF2E7D32),
                metadata: 'Check-in: Today, 09:00 AM',
                extraDetail: 'Duration: 4 Hours',
                actionType: RequestCardActionType.viewDetails,
              ),
              const SizedBox(height: AppSizes.mediumSpacing),
              RequestCard(
                initials: 'LP',
                name: 'Linda Park',
                host: 'Marcus Thorne',
                status: 'COMPLETED',
                statusColor: const Color(0xFFE5E9F0),
                statusTextColor: const Color(0xFF6B7280),
                metadata: 'Checked out at 4:12 PM',
                extraDetail: '',
                actionType: RequestCardActionType.none,
              ),
              const SizedBox(height: AppSizes.sectionSpacing),
              const DailyTrafficCard(
                scheduled: '24',
                inBuilding: '18',
                expected: '6',
              ),
              const SizedBox(height: AppSizes.sectionSpacing),
            ],
          ),
        );
      },
    );
  }
}
