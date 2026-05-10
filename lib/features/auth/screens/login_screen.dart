import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vms_app/core/theme/app_theme.dart';
import 'package:vms_app/core/utils/app_sizes.dart';
import 'package:vms_app/features/auth/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      backgroundColor: AppTheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: AppSizes.largeSpacing),
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final horizontalPadding = constraints.maxWidth >= 640
                    ? AppSizes.wideScreenPadding
                    : AppSizes.screenPadding;
                final cardPadding = constraints.maxWidth >= 640
                    ? 36.0
                    : AppSizes.screenPadding;
                final titleSize = constraints.maxWidth >= 360 ? 14.0 : 12.0;
                final cardMaxWidth = constraints.maxWidth >= 640
                    ? 560.0
                    : constraints.maxWidth;

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: cardMaxWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: AppSizes.smallSpacing),
                        Text(
                          'HOST OPS',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: AppTheme.primary,
                            fontSize: titleSize,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.0,
                          ),
                        ),
                        const SizedBox(height: AppSizes.largeSpacing),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.12),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: cardPadding,
                            vertical: AppSizes.sectionSpacing + 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome back',
                                style: theme.textTheme.headlineLarge?.copyWith(
                                  color: AppTheme.onSurface,
                                  height: 1.05,
                                ),
                              ),
                              const SizedBox(height: AppSizes.smallSpacing),
                              Text(
                                'Access your administrative terminal',
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: AppSizes.largeSpacing),
                              const LoginForm(isLoading: false),
                              const SizedBox(height: AppSizes.largeSpacing),
                              LayoutBuilder(
                                builder: (context, rowConstraints) {
                                  final useVerticalLayout =
                                      rowConstraints.maxWidth < 420;
                                  return useVerticalLayout
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _SecurityBadge(),
                                            const SizedBox(
                                              height: AppSizes.mediumSpacing,
                                            ),
                                            _SecurityCopy(theme: theme),
                                          ],
                                        )
                                      : Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _SecurityBadge(),
                                            const SizedBox(width: 14),
                                            Expanded(
                                              child: _SecurityCopy(
                                                theme: theme,
                                              ),
                                            ),
                                          ],
                                        );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSizes.largeSpacing),
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: AppSizes.mediumSpacing,
                          runSpacing: AppSizes.smallSpacing + 4,
                          children: const [
                            _FooterLink(label: 'Privacy Policy'),
                            _FooterLink(label: 'Terms of Service'),
                            _FooterLink(label: 'Support'),
                          ],
                        ),
                        const SizedBox(height: AppSizes.mediumSpacing),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  const _FooterLink({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppTheme.onSurfaceVariant,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _SecurityBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppTheme.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.shield_outlined,
        color: AppTheme.primary,
        size: 22,
      ),
    );
  }
}

class _SecurityCopy extends StatelessWidget {
  final ThemeData theme;

  const _SecurityCopy({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enterprise Grade Encryption',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppTheme.onSurface,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Authorized personnel only. Access is monitored and logged for security compliance.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
