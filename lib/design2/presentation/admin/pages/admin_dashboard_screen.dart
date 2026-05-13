import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/responsive_layout.dart';
import '../../auth/bloc/auth_bloc.dart';
import '../../auth/bloc/auth_event.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Scaffold(
      appBar: isDesktop
          ? null
          : AppBar(
              title: Text('Dashboard', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white)),
              backgroundColor: AppTheme.primaryColor,
              iconTheme: const IconThemeData(color: Colors.white),
              elevation: 0,
            ),
      drawer: isDesktop ? null : const Drawer(child: AdminNavRail()),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDesktop) const AdminNavRail(),
          Expanded(
            child: Column(
              children: [
                if (isDesktop) const _TopHeader(),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
                    children: [
                      Text(
                        'Overview',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Here is what is happening in your sites today.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 32),
                      // Responsive Stat Grid
                      ResponsiveLayout(
                        mobile: Column(children: _buildStatCards(context)),
                        tablet: Wrap(
                          spacing: 24,
                          runSpacing: 24,
                          children: _buildStatCards(context).map((c) => SizedBox(width: 300, child: c)).toList(),
                        ),
                        desktop: Row(
                          children: _buildStatCards(context)
                              .map((e) => Expanded(child: Padding(padding: const EdgeInsets.only(right: 24), child: e)))
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 48),
                      Text(
                        'Live Geofencing',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 24),
                      Container(
                        height: 500,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 24, offset: const Offset(0, 8))
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Stack(
                            children: [
                              // Placeholder for Map
                              Positioned.fill(
                                child: Opacity(
                                  opacity: 0.4,
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1524661135-423995f22d0b?q=80&w=2074&auto=format&fit=crop', // Abstract map visual
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: Colors.white),
                                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.map_outlined, size: 48, color: AppTheme.primaryColor),
                                      const SizedBox(height: 16),
                                      Text('Map Component', style: Theme.of(context).textTheme.headlineMedium),
                                      const SizedBox(height: 8),
                                      Text('Interactive Google/Mapbox widget goes here.', style: Theme.of(context).textTheme.bodyMedium),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildStatCards(BuildContext context) {
    return [
      _StatCard(title: 'Active Visitors', value: '1,245', icon: Icons.sensor_door, trend: '+14% this week', color: AppTheme.primaryColor),
      const _StatCard(title: 'Hosts Available', value: '45', icon: Icons.badge, trend: 'Stable', color: Color(0xFF1E88E5)),
      const _StatCard(title: 'Geofenced Sites', value: '3', icon: Icons.location_on, trend: 'All online', color: Color(0xFF43A047)),
    ];
  }
}

class _TopHeader extends StatelessWidget {
  const _TopHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            width: 300,
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey.shade500),
                const SizedBox(width: 12),
                Text('Search anywhere...', style: TextStyle(color: Colors.grey.shade500)),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            color: AppTheme.textPrimary,
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          CircleAvatar(
            backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
            child: const Text('AD', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

class AdminNavRail extends StatefulWidget {
  const AdminNavRail({super.key});

  @override
  State<AdminNavRail> createState() => _AdminNavRailState();
}

class _AdminNavRailState extends State<AdminNavRail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: ResponsiveLayout.isDesktop(context) ? 0 : 8,
      child: Container(
        width: ResponsiveLayout.isDesktop(context) ? 260 : null,
        decoration: BoxDecoration(
          border: ResponsiveLayout.isDesktop(context)
              ? Border(right: BorderSide(color: Colors.grey.shade200))
              : null,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.shield, color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Text('VMS Portal', style: Theme.of(context).textTheme.headlineMedium),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildNavItem(0, Icons.dashboard_rounded, 'Dashboard'),
            _buildNavItem(1, Icons.people_alt_rounded, 'Employees'),
            _buildNavItem(2, Icons.map_rounded, 'Locations'),
            _buildNavItem(3, Icons.settings_rounded, 'Settings'),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: InkWell(
                onTap: () => context.read<AuthBloc>().add(LogoutRequested()),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.logout_rounded, color: AppTheme.primaryColor),
                      const SizedBox(width: 16),
                      Text('Log Out', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: () => setState(() => _selectedIndex = index),
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primaryColor.withOpacity(0.08) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, color: isSelected ? AppTheme.primaryColor : AppTheme.textSecondary),
              const SizedBox(width: 16),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: isSelected ? AppTheme.primaryColor : AppTheme.textSecondary,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final String trend;
  final Color color;

  const _StatCard({required this.title, required this.value, required this.icon, required this.trend, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: ResponsiveLayout.isMobile(context) ? const EdgeInsets.only(bottom: 24) : EdgeInsets.zero,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(trend, style: TextStyle(color: Colors.grey.shade700, fontSize: 12, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(value, style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 40)),
          const SizedBox(height: 8),
          Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppTheme.textSecondary)),
        ],
      ),
    );
  }
}
