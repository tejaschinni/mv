import 'package:flutter/material.dart';
import 'package:vms_app/core/theme/app_theme.dart';
import 'package:vms_app/core/utils/app_sizes.dart';

class DashboardBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onTap;

  const DashboardBottomNav({super.key, this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: AppTheme.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: AppSizes.navBarHorizontalPadding,
        ),
        child: Row(
          children: [
            Expanded(child: _navItem(0, 'Home', Icons.home_filled)),
            Expanded(
              child: _navItem(1, 'Appointments', Icons.calendar_today_outlined),
            ),
            Expanded(child: _navItem(2, 'Employees', Icons.group_outlined)),
            Expanded(child: _navItem(3, 'Security', Icons.shield_outlined)),
          ],
        ),
      ),
    );
  }

  Widget _navItem(int index, String label, IconData iconData) {
    final selected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTap?.call(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6.0),
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.bottomNavItemVerticalPadding,
          horizontal: AppSizes.bottomNavItemHorizontalPadding,
        ),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(
            AppSizes.bottomNavItemBorderRadius,
          ),
        ),
        child: BottomNavItem(
          label: label,
          iconData: iconData,
          selected: selected,
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String label;
  final IconData iconData;
  final bool selected;

  const BottomNavItem({
    super.key,
    required this.label,
    required this.iconData,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: selected ? AppTheme.primary : Colors.white70,
          size: AppSizes.bottomNavIconSize,
        ),
        const SizedBox(height: AppSizes.bottomNavTextSpacing),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 10,
              color: selected ? AppTheme.primary : Colors.white70,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
