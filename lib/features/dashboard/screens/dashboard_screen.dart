import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_app/core/common/widgets/custom_appbar_widget.dart';
import 'package:vms_app/core/common/router/app_router.dart';
import 'package:vms_app/core/theme/app_theme.dart';
import 'package:vms_app/core/utils/app_sizes.dart';
import 'package:vms_app/features/dashboard/widgets/dashboard_bottom_nav.dart';

class DashboardScreen extends StatelessWidget {
  final Widget child;
  final int selectedIndex;

  const DashboardScreen({
    super.key,
    required this.child,
    required this.selectedIndex,
  });

  void _onNavItemTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.goNamed(AppRoutes.dashboardHome);
        break;
      case 1:
        context.goNamed(AppRoutes.dashboardAppointments);
        break;
      case 2:
        context.goNamed(AppRoutes.dashboardEmployees);
        break;
      case 3:
        context.goNamed(AppRoutes.dashboardSecurity);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surface,
      appBar: CustomAppBarWidget(
        title: 'HOST ADMIN',
        showStatus: false,
        actions: [
          Container(
            height: AppSizes.avatarSize,
            width: AppSizes.avatarSize,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=200&q=80',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: child,
      bottomNavigationBar: DashboardBottomNav(
        selectedIndex: selectedIndex,
        onTap: (index) => _onNavItemTap(context, index),
      ),
    );
  }
}
