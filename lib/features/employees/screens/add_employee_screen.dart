import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_app/core/theme/app_theme.dart';
import 'package:vms_app/core/utils/app_sizes.dart';
import 'package:vms_app/features/employees/widgets/employee_section_card.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  String _selectedRole = 'ADMIN';
  bool _buildingAccess = true;
  bool _adminRights = false;
  bool _receivesNotifications = true;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 720;
    
    return Scaffold(
      backgroundColor: AppTheme.surface,
      appBar: AppBar(
        backgroundColor: AppTheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.primary),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Add New Employee',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppTheme.primary,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: AppTheme.outlineVariant.withOpacity(0.5),
              child: const Icon(Icons.shield_outlined, color: AppTheme.onSurfaceVariant, size: 20),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: AppTheme.outlineVariant,
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isWide ? AppSizes.wideScreenPadding : AppSizes.screenPadding,
          vertical: AppSizes.largeSpacing,
        ),
        child: Column(
          children: [
            // Upload Photo Section
            Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppTheme.primary.withOpacity(0.05),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.primary.withOpacity(0.3),
                        width: 2,
                        style: BorderStyle.solid, // Should ideally be dashed, using solid for simplicity
                      ),
                    ),
                    child: Icon(Icons.person_outline, size: 50, color: AppTheme.primary.withOpacity(0.5)),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload_outlined, color: AppTheme.primary, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        'Upload Photo',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Basic Information
            EmployeeSectionCard(
              iconData: Icons.badge_outlined,
              title: 'Basic Information',
              child: Column(
                children: [
                  _buildTextField(context, 'Full Name', 'Johnathan Doe'),
                  const SizedBox(height: 16),
                  _buildTextField(context, 'Email Address', 'j.doe@enterprise.com'),
                  const SizedBox(height: 16),
                  _buildTextField(context, 'Phone Number', '+1 (555) 000-0000'),
                ],
              ),
            ),

            // Professional Details
            EmployeeSectionCard(
              iconData: Icons.work_outline,
              title: 'Professional Details',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Role Selection',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppTheme.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      'ADMIN', 'HOST', 'RECEPTIONIST', 'SECURITY', 'SUPER_ADMIN'
                    ].map((role) {
                      final isSelected = _selectedRole == role;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedRole = role),
                        child: Container(
                          width: isWide ? 140 : (MediaQuery.of(context).size.width - AppSizes.screenPadding * 2 - 40 - 8) / 2, // 2 columns roughly
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: isSelected ? AppTheme.primary.withOpacity(0.05) : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSelected ? AppTheme.primary : AppTheme.outlineVariant,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            role,
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: isSelected ? AppTheme.primary : AppTheme.onSurfaceVariant,
                              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(context, 'Department/Team', 'Operations / Front Desk'),
                ],
              ),
            ),

            // Access & Permissions
            EmployeeSectionCard(
              iconData: Icons.security_outlined,
              title: 'Access & Permissions',
              child: Column(
                children: [
                  _buildSwitch(
                    context,
                    'Building Access',
                    'Grant entry permissions to facilities',
                    _buildingAccess,
                    (v) => setState(() => _buildingAccess = v),
                  ),
                  const Divider(height: 32),
                  _buildSwitch(
                    context,
                    'System Admin Rights',
                    'Ability to modify core system settings',
                    _adminRights,
                    (v) => setState(() => _adminRights = v),
                  ),
                  const Divider(height: 32),
                  _buildSwitch(
                    context,
                    'Receives Notifications',
                    'Enable push and email alerts',
                    _receivesNotifications,
                    (v) => setState(() => _receivesNotifications = v),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add employee logic
                  context.pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Add Employee', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
              ),
            ),
            const SizedBox(height: AppSizes.largeSpacing),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppTheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppTheme.outlineVariant),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppTheme.outlineVariant),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppTheme.primary),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSwitch(BuildContext context, String title, String subtitle, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.onSurfaceVariant,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.white,
          activeTrackColor: AppTheme.primary,
        ),
      ],
    );
  }
}
