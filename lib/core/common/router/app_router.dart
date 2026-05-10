import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_app/features/auth/screens/login_screen.dart';
import 'package:vms_app/features/auth/screens/splash_screen.dart';
import 'package:vms_app/features/dashboard/screens/dashboard_screen.dart';
import 'package:vms_app/features/dashboard/screens/home_screen.dart';
import 'package:vms_app/features/dashboard/screens/appointment_requests_screen.dart';
import 'package:vms_app/features/employees/screens/staff_directory_screen.dart';
import 'package:vms_app/features/employees/screens/add_employee_screen.dart';
import 'package:vms_app/features/dashboard/screens/security_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = 'splash';
  static const String login = 'login';
  static const String dashboardHome = 'dashboard_home';
  static const String dashboardAppointments = 'dashboard_appointments';
  static const String dashboardEmployees = 'dashboard_employees';
  static const String dashboardSecurity = 'dashboard_security';
}

int _dashboardIndexFromLocation(String location) {
  if (location.startsWith('/dashboard/appointments')) return 1;
  if (location.startsWith('/dashboard/employees')) return 2;
  if (location.startsWith('/dashboard/security')) return 3;
  return 0;
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => DashboardScreen(
          selectedIndex: _dashboardIndexFromLocation(state.uri.path),
          child: child,
        ),
        routes: [
          GoRoute(
            path: '/dashboard/home',
            name: AppRoutes.dashboardHome,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/dashboard/appointments',
            name: AppRoutes.dashboardAppointments,
            builder: (context, state) => const AppointmentRequestsScreen(),
          ),
          GoRoute(
            path: '/dashboard/employees',
            name: AppRoutes.dashboardEmployees,
            builder: (context, state) => const StaffDirectoryScreen(),
          ),
          GoRoute(
            path: '/dashboard/employees/add',
            builder: (context, state) => const AddEmployeeScreen(),
          ),
          GoRoute(
            path: '/dashboard/security',
            name: AppRoutes.dashboardSecurity,
            builder: (context, state) => const SecurityScreen(),
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      if (state.uri.path == '/dashboard') return '/dashboard/home';
      return null;
    },
  );
}
