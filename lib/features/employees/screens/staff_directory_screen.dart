import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_app/core/theme/app_theme.dart';
import 'package:vms_app/core/utils/app_sizes.dart';
import 'package:vms_app/features/employees/widgets/staff_card.dart';
import 'package:vms_app/features/employees/widgets/staff_filter_chip.dart';

class StaffDirectoryScreen extends StatefulWidget {
  const StaffDirectoryScreen({super.key});

  @override
  State<StaffDirectoryScreen> createState() => _StaffDirectoryScreenState();
}

class _StaffDirectoryScreenState extends State<StaffDirectoryScreen> {
  String _selectedFilter = 'All Staff';

  final List<Map<String, dynamic>> _staffMembers = [
    {
      'name': 'Marcus Chen',
      'role': 'Admin',
      'department': 'System Lead',
      'imageUrl': 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&w=150&q=80',
      'statusColor': Colors.green,
    },
    {
      'name': 'Elena Rodriguez',
      'role': 'Host',
      'department': 'VIP Relations',
      'imageUrl': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=150&q=80',
      'statusColor': Colors.green,
    },
    {
      'name': 'Jordan Smith',
      'role': 'Receptionist',
      'department': 'Front Desk',
      'imageUrl': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=150&q=80',
      'statusColor': Colors.orange,
    },
    {
      'name': 'Sarah Vance',
      'role': 'Admin',
      'department': 'Security Lead',
      'imageUrl': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&w=150&q=80',
      'statusColor': Colors.grey,
    },
    {
      'name': 'Priya Sharma',
      'role': 'Host',
      'department': 'Events Coordinator',
      'imageUrl': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=150&q=80',
      'statusColor': Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 720;
          final padding = EdgeInsets.symmetric(
            horizontal: isWide ? AppSizes.wideScreenPadding : AppSizes.screenPadding,
            vertical: AppSizes.screenPadding,
          );

          return Stack(
            children: [
              SingleChildScrollView(
                padding: padding.copyWith(bottom: 100), // Extra padding for FAB
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Staff Directory',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: AppTheme.onSurface,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppTheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '24 ACTIVE',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: AppTheme.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.mediumSpacing),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          'All Staff',
                          'Admins',
                          'Hosts',
                          'Receptionists'
                        ].map((filter) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: StaffFilterChip(
                              label: filter,
                              isSelected: _selectedFilter == filter,
                              onTap: () {
                                setState(() {
                                  _selectedFilter = filter;
                                });
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: AppSizes.sectionSpacing),
                    ..._staffMembers.map((staff) {
                      return StaffCard(
                        name: staff['name'],
                        role: staff['role'],
                        department: staff['department'],
                        imageUrl: staff['imageUrl'],
                        statusColor: staff['statusColor'],
                      );
                    }).toList(),
                  ],
                ),
              ),
              Positioned(
                bottom: AppSizes.screenPadding,
                right: AppSizes.screenPadding,
                child: FloatingActionButton(
                  onPressed: () {
                    context.go('/dashboard/employees/add');
                  },
                  backgroundColor: AppTheme.primary,
                  child: const Icon(Icons.person_add_alt_1, color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
