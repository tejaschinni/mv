import 'package:flutter/material.dart';
import 'package:vms_app/core/theme/app_theme.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search visitors or hosts...',
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.search, color: AppTheme.onSurfaceVariant),
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: AppTheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: AppTheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: AppTheme.primary.withOpacity(0.8)),
        ),
      ),
    );
  }
}
