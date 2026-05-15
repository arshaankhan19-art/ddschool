import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/presentation/auth_provider.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/dashboard/presentation/admin_dashboard.dart';
import '../../features/dashboard/presentation/school_admin_dashboard.dart';
import '../../features/dashboard/presentation/principal_dashboard.dart';
import '../../features/dashboard/presentation/teacher_dashboard.dart';
import '../../features/dashboard/presentation/student_dashboard.dart';
import '../../features/dashboard/presentation/parent_dashboard.dart';
import '../../features/auth/domain/user_role.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  final userData = ref.watch(currentUserDataProvider);

  return GoRouter(
    initialLocation: '/splash',
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
        builder: (context, state) => const AdminDashboard(),
      ),
      GoRoute(
        path: '/school-admin',
        builder: (context, state) => const SchoolAdminDashboard(),
      ),
      GoRoute(
        path: '/principal',
        builder: (context, state) => const PrincipalDashboard(),
      ),
      GoRoute(
        path: '/teacher',
        builder: (context, state) => const TeacherDashboard(),
      ),
      GoRoute(
        path: '/student',
        builder: (context, state) => const StudentDashboard(),
      ),
      GoRoute(
        path: '/parent',
        builder: (context, state) => const ParentDashboard(),
      ),
    ],
    redirect: (context, state) {
      final loggingIn = state.matchedLocation == '/login';
      final inSplash = state.matchedLocation == '/splash';

      return authState.when(
        data: (state) {
          final session = state.session;
          if (session == null) {
            return (loggingIn || inSplash) ? null : '/login';
          }

          if (inSplash || loggingIn) {
            return userData.when(
              data: (user) {
                if (user == null) return null;
                switch (user.role) {
                  case UserRole.superAdmin:
                    return '/admin';
                  case UserRole.schoolAdmin:
                    return '/school-admin';
                  case UserRole.principal:
                    return '/principal';
                  case UserRole.teacher:
                    return '/teacher';
                  case UserRole.student:
                    return '/student';
                  case UserRole.parent:
                    return '/parent';
                  default:
                    return '/login';
                }
              },
              loading: () => null,
              error: (_, __) => '/login',
            );
          }
          return null;
        },
        loading: () => null,
        error: (_, __) => '/login',
      );
    },
  );
});
