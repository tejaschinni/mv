import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_app/core/common/router/app_router.dart';
import 'package:vms_app/core/theme/app_theme.dart';
import 'package:vms_app/core/utils/app_sizes.dart';

class LoginForm extends StatefulWidget {
  final bool isLoading;
  const LoginForm({super.key, required this.isLoading});

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppTheme.surface,
              prefixIcon: const Icon(Icons.email_outlined),
              labelText: 'Email Address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppTheme.primary.withOpacity(0.8),
                  width: 1.5,
                ),
              ),
              labelStyle: theme.textTheme.labelMedium,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your email address';
              }
              return null;
            },
          ),
          const SizedBox(height: AppSizes.mediumSpacing),
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppTheme.surface,
              prefixIcon: const Icon(Icons.lock_outline),
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () =>
                    setState(() => _obscurePassword = !_obscurePassword),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppTheme.primary.withOpacity(0.8),
                  width: 1.5,
                ),
              ),
              labelStyle: theme.textTheme.labelMedium,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: AppSizes.smallSpacing),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(40, 30),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Forgot Password?',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.sectionSpacing),
          SizedBox(
            width: double.infinity,
            height: AppSizes.buttonHeight,
            child: ElevatedButton(
              onPressed: widget.isLoading
                  ? null
                  : () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context.goNamed(AppRoutes.dashboardHome);
                      }
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryContainer,
                foregroundColor: AppTheme.onPrimaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              child: widget.isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Sign In'),
            ),
          ),
        ],
      ),
    );
  }
}
