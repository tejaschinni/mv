import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../domain/entities/user.dart';
import '../presentation/auth/bloc/auth_bloc.dart';
import '../presentation/auth/bloc/auth_state.dart';
import '../presentation/auth/pages/splash_screen.dart';
import '../presentation/auth/pages/login_screen.dart';
import '../presentation/admin/pages/admin_dashboard_screen.dart';
import '../presentation/host/pages/host_dashboard_screen.dart';
import '../presentation/receptionist/pages/receptionist_dashboard_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

GoRouter createRouter(AuthBloc authBloc) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    redirect: (BuildContext context, GoRouterState state) {
      final authState = authBloc.state;
      final isLoggingIn = state.matchedLocation == '/login';
      final isSplash = state.matchedLocation == '/splash';

      if (authState is AuthInitial || authState is AuthLoading) {
        return isSplash ? null : '/splash';
      }

      if (authState is Unauthenticated || authState is AuthError) {
        return isLoggingIn ? null : '/login';
      }

      if (authState is Authenticated) {
        if (isLoggingIn || isSplash) {
          switch (authState.user.role) {
            case UserRole.admin: return '/admin';
            case UserRole.host: return '/host';
            case UserRole.receptionist: return '/receptionist';
          }
        }
        
        // Role-based route guarding
        if (state.matchedLocation.startsWith('/admin') && authState.user.role != UserRole.admin) return '/login';
        if (state.matchedLocation.startsWith('/host') && authState.user.role != UserRole.host) return '/login';
        if (state.matchedLocation.startsWith('/receptionist') && authState.user.role != UserRole.receptionist) return '/login';
      }
      
      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/admin',
        builder: (context, state) => const AdminDashboardScreen(),
      ),
      GoRoute(
        path: '/host',
        builder: (context, state) => const HostDashboardScreen(),
      ),
      GoRoute(
        path: '/receptionist',
        builder: (context, state) => const ReceptionistDashboardScreen(),
      ),
    ],
  );
}
