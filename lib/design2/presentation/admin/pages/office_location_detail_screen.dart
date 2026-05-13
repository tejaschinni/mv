import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class OfficeLocationDetailScreen extends StatelessWidget {
  const OfficeLocationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: AppTheme.primaryColor),
        title: const Text(
          'Office Location Detail',
          style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black87),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('General Settings', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text('Manage primary identity and\nregional preferences.', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        child: const Text('Save\nChanges', textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildLabel(context, 'Location Name'),
                  const SizedBox(height: 8),
                  _buildTextField('HQ West Wing - Seattle'),
                  const SizedBox(height: 16),
                  _buildLabel(context, 'Timezone'),
                  const SizedBox(height: 8),
                  _buildTextField('(GMT-08:00) Pacific Time (US & C'),
                  const SizedBox(height: 16),
                  _buildLabel(context, 'Physical Address'),
                  const SizedBox(height: 8),
                  _buildTextField('2101 4th Ave, Seattle, WA 981', prefixIcon: Icons.location_on_outlined),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1524661135-423995f22d0b?q=80&w=2074&auto=format&fit=crop'), // Placeholder map
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                ),
              ),
              child: Stack(
                children: [
                  const Center(
                    child: Icon(Icons.location_on, color: AppTheme.primaryColor, size: 48),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Operational Perimeter', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('Verified Coordinates: 47.6132° N, 122.3414° W', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Secure Zones', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                      const Icon(Icons.add_circle_outline, color: AppTheme.primaryColor),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text('Manage access protocols for specific\nrestricted areas within the location.', style: TextStyle(color: Colors.grey.shade600, fontStyle: FontStyle.italic, fontSize: 12)),
                  const SizedBox(height: 24),
                  _buildToggleRow(context, Icons.lock_outline, 'Server Vault', 'Level 4 Clearance', true),
                  const SizedBox(height: 12),
                  _buildToggleRow(context, Icons.meeting_room_outlined, 'Executive Suite', 'Biometric Only', true),
                  const SizedBox(height: 12),
                  _buildToggleRow(context, Icons.inventory_2_outlined, 'Supply Room', 'Badge Required', false),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.history, color: Colors.black87),
                              const SizedBox(height: 24),
                              Text('Access Logs', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.ac_unit, color: AppTheme.primaryColor), // Using snowflake as a placeholder for the asterisk/lockdown icon
                              const SizedBox(height: 24),
                              Text('Lockdown\nMode', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryColor)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleRow(BuildContext context, IconData icon, String title, String subtitle, bool isToggled) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
              ],
            ),
          ),
          Switch(
            value: isToggled,
            onChanged: (val) {},
            activeColor: AppTheme.primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context, String text) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
    );
  }

  Widget _buildTextField(String hint, {IconData? prefixIcon}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.grey) : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red.shade100),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red.shade100),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
