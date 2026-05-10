import 'package:flutter/material.dart';
import 'package:vms_app/core/theme/app_theme.dart';
import 'package:vms_app/core/utils/app_sizes.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final padding = EdgeInsets.symmetric(
          horizontal: constraints.maxWidth >= 720
              ? AppSizes.wideScreenPadding
              : AppSizes.screenPadding,
          vertical: AppSizes.screenPadding,
        );
        
        return SingleChildScrollView(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Security Management',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppSizes.mediumSpacing),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.outlineVariant),
                ),
                child: const Center(
                  child: Text(
                    'Security logs and override settings coming soon.',
                    style: TextStyle(color: AppTheme.onSurfaceVariant),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
