import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class RegisterVisitorScreen extends StatelessWidget {
  const RegisterVisitorScreen({super.key});

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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=a042581f4e29026704d'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Visitors', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
                const Text('Add New Visitor', style: TextStyle(color: AppTheme.primaryColor, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 16),
            Text('Register New Visitor', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text('Fill in the details below to check in a manual visitor entry.', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 24),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.close, color: AppTheme.primaryColor),
              label: const Text('Cancel Entry', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              icon: Icons.person_add_alt_1,
              title: 'Visitor Information',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel(context, 'Visitor Name'),
                  const SizedBox(height: 8),
                  _buildTextField('e.g. Jonathan Doe'),
                  const SizedBox(height: 16),
                  _buildLabel(context, 'Company'),
                  const SizedBox(height: 8),
                  _buildTextField('e.g. Acme Corp'),
                  const SizedBox(height: 16),
                  _buildLabel(context, 'Purpose of Visit'),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    decoration: _inputDecoration('Business Meeting'),
                    items: const [
                      DropdownMenuItem(value: 'meeting', child: Text('Business Meeting')),
                    ],
                    onChanged: (val) {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              icon: Icons.person_search_outlined,
              title: 'Host & Location',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel(context, 'Search Host Name'),
                  const SizedBox(height: 8),
                  _buildTextField('Search by name or department', prefixIcon: Icons.search),
                  const SizedBox(height: 16),
                  _buildLabel(context, 'Check-in Time'),
                  const SizedBox(height: 8),
                  _buildTextField('mm/dd/yyyy, --:--', suffixIcon: Icons.calendar_today_outlined),
                  const SizedBox(height: 16),
                  _buildLabel(context, 'Expected Check-out'),
                  const SizedBox(height: 8),
                  _buildTextField('mm/dd/yyyy, --:--', suffixIcon: Icons.calendar_today_outlined),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              icon: Icons.security,
              title: 'Security & Policy',
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.edit_document, color: AppTheme.primaryColor, size: 20),
                            const SizedBox(width: 12),
                            Text('NDA Signed', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade800)),
                          ],
                        ),
                        Switch(
                          value: false,
                          onChanged: (val) {},
                          activeColor: AppTheme.primaryColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red.shade100, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.camera_alt_outlined, size: 32, color: Colors.black54),
                        const SizedBox(height: 8),
                        Text('Capture visitor photo (optional)', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                        const SizedBox(height: 16),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppTheme.primaryColor,
                            side: const BorderSide(color: AppTheme.primaryColor),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text('Start Camera'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.person_add_alt_1),
                label: const Text('Register Visitor'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'A confirmation notification will be sent to the host\nautomatically.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, {required IconData icon, required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppTheme.primaryColor),
              const SizedBox(width: 12),
              Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 24),
          child,
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600, color: Colors.grey.shade700),
    );
  }

  InputDecoration _inputDecoration(String hint, {IconData? prefixIcon, IconData? suffixIcon}) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.grey) : null,
      suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: Colors.grey) : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      fillColor: Colors.white,
      filled: true,
    );
  }

  Widget _buildTextField(String hint, {IconData? prefixIcon, IconData? suffixIcon}) {
    return TextField(
      decoration: _inputDecoration(hint, prefixIcon: prefixIcon, suffixIcon: suffixIcon),
    );
  }
}
