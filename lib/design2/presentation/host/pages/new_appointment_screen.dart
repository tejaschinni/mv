import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class NewAppointmentScreen extends StatelessWidget {
  const NewAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: AppTheme.primaryColor),
        title: const Text(
          'OfficeHub',
          style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.red.shade100, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('New Appointment', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20)),
                    const Icon(Icons.close, color: Colors.black54),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStep(context, '1', 'Visitor Details', isActive: true),
                    _buildStep(context, '2', 'Schedule', isActive: false),
                    _buildStep(context, '3', 'Confirmation', isActive: false),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Divider(color: Colors.redAccent, height: 1, thickness: 0.5),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel(context, 'Full Name'),
                    const SizedBox(height: 8),
                    _buildTextField('e.g. Alexander Hamilton'),
                    const SizedBox(height: 16),
                    _buildLabel(context, 'Email Address'),
                    const SizedBox(height: 8),
                    _buildTextField('alexander@example.com'),
                    const SizedBox(height: 16),
                    _buildLabel(context, 'Phone Number'),
                    const SizedBox(height: 8),
                    _buildTextField('+1 (555) 000-0000'),
                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 24),
                    _buildLabel(context, 'Date'),
                    const SizedBox(height: 8),
                    _buildTextField('mm/dd/yyyy', suffixIcon: Icons.calendar_today_outlined),
                    const SizedBox(height: 16),
                    _buildLabel(context, 'Time'),
                    const SizedBox(height: 8),
                    _buildTextField('--:-- --', suffixIcon: Icons.access_time),
                    const SizedBox(height: 32),
                    _buildInfoBlock(Icons.security, 'Secure', 'Encrypted visitor log.'),
                    const SizedBox(height: 12),
                    _buildInfoBlock(Icons.notifications_active_outlined, 'Auto-Notify', 'Host alerts via SMS.', isAlert: true),
                    const SizedBox(height: 12),
                    _buildInfoBlock(Icons.badge_outlined, 'Pre-Print', 'Badge ready at desk.', isAlert: true),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
                  border: Border(top: BorderSide(color: Colors.grey.shade200)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Cancel', style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Next Step'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(BuildContext context, String number, String label, {required bool isActive}) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isActive ? AppTheme.primaryColor : Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.grey.shade600,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: isActive ? AppTheme.primaryColor : Colors.grey.shade600,
            fontSize: 10,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(BuildContext context, String text) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.brown),
    );
  }

  Widget _buildTextField(String hint, {IconData? suffixIcon}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: Colors.black87) : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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

  Widget _buildInfoBlock(IconData icon, String title, String subtitle, {bool isAlert = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: isAlert ? AppTheme.primaryColor : AppTheme.primaryDark, size: 24),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              Text(subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}
