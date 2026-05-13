import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/responsive_layout.dart';
import 'add_employee_screen.dart';

class StaffDirectoryScreen extends StatelessWidget {
  const StaffDirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Scaffold(
      backgroundColor: AppTheme.surfaceColor,
      appBar: AppBar(
        backgroundColor: AppTheme.surfaceColor,
        elevation: 0,
        title: const Text(''), // Space for custom layout if needed
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Staff Directory', style: Theme.of(context).textTheme.displaySmall),
              const SizedBox(height: 8),
              Text(
                'Manage and contact office hosts across all departments.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  // Navigate to add employee screen
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const AddEmployeeScreen()),
                  );
                },
                icon: const Icon(Icons.person_add),
                label: const Text('Add Staff'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 24),
              
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search by name, role, or department...',
                  prefixIcon: const Icon(Icons.search),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Engineering Section
              _buildDepartmentSection(
                context,
                title: 'ENGINEERING',
                onlineCount: 12,
                child: Column(
                  children: [
                    _buildListTile(
                      name: 'Alex Mercer',
                      role: 'Lead Developer • Floor 3',
                      statusColor: Colors.green,
                      imageUrl: 'https://i.pravatar.cc/150?u=alex',
                    ),
                    const Divider(height: 1),
                    _buildListTile(
                      name: 'Sarah Chen',
                      role: 'Systems Architect • Floor 3',
                      statusColor: Colors.green,
                      imageUrl: 'https://i.pravatar.cc/150?u=sarah',
                    ),
                    const Divider(height: 1),
                    _buildListTileWithButton(
                      name: 'David Kim',
                      role: 'DevOps Specialist • In Meeting',
                      statusColor: Colors.amber,
                      imageUrl: 'https://i.pravatar.cc/150?u=david',
                      buttonText: 'NOTIFY ME',
                      isOffline: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Marketing Section
              _buildDepartmentSection(
                context,
                title: 'MARKETING',
                onlineCount: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildGridCard(
                          name: 'Jordan Lee',
                          role: 'Creative Lead',
                          statusColor: Colors.green,
                          imageUrl: 'https://i.pravatar.cc/150?u=jordan',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildGridCard(
                          name: 'Maria Wong',
                          role: 'PR Manager',
                          statusColor: Colors.green,
                          imageUrl: 'https://i.pravatar.cc/150?u=maria',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Operations Section
              _buildDepartmentSection(
                context,
                title: 'OPERATIONS & SECURITY',
                child: Column(
                  children: [
                    _buildListTileWithButton(
                      name: 'Tom Rogers',
                      role: 'Security Head',
                      statusColor: Colors.green,
                      imageUrl: 'https://i.pravatar.cc/150?u=tom',
                      buttonText: 'MESSAGE',
                      isOffline: false,
                    ),
                    const Divider(height: 1),
                    _buildListTileWithButton(
                      name: 'Elena Brooks',
                      role: 'Facility Mgr',
                      statusColor: Colors.green,
                      imageUrl: 'https://i.pravatar.cc/150?u=elena',
                      buttonText: 'MESSAGE',
                      isOffline: false,
                    ),
                    const Divider(height: 1),
                    _buildListTileWithButton(
                      name: 'Jack Miller',
                      role: 'On Leave',
                      statusColor: AppTheme.primaryColor,
                      imageUrl: 'https://i.pravatar.cc/150?u=jack',
                      buttonText: 'OFFLINE',
                      isOffline: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDepartmentSection(BuildContext context, {required String title, int? onlineCount, required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              children: [
                Icon(Icons.work_outline, color: Colors.grey.shade600, size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                        letterSpacing: 1.1,
                      ),
                ),
                const Spacer(),
                if (onlineCount != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '$onlineCount ONLINE',
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }

  Widget _buildListTile({
    required String name,
    required String role,
    required Color statusColor,
    required String imageUrl,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 24,
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
                Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                const SizedBox(height: 2),
                Text(role, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTileWithButton({
    required String name,
    required String role,
    required Color statusColor,
    required String imageUrl,
    required String buttonText,
    required bool isOffline,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 24,
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
                Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                const SizedBox(height: 2),
                Text(role, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isOffline ? Colors.grey.shade200 : AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                color: isOffline ? Colors.grey.shade700 : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridCard({
    required String name,
    required String role,
    required Color statusColor,
    required String imageUrl,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(imageUrl),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(role, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone_outlined, color: AppTheme.primaryColor, size: 20),
              const SizedBox(width: 16),
              Icon(Icons.chat_bubble_outline, color: AppTheme.primaryColor, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
