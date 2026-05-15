import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/presentation/auth_provider.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/signup_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/super_admin/presentation/super_admin_dashboard.dart';
import '../../features/super_admin/presentation/schools_list_screen.dart';
import '../../features/super_admin/presentation/add_edit_school_screen.dart';
import '../../features/super_admin/presentation/revenue_screen.dart';
import '../../features/super_admin/presentation/subscription_management_screen.dart';
import '../../features/super_admin/presentation/analytics_screen.dart';
import '../../features/school_admin/presentation/school_admin_dashboard.dart';
import '../../features/school_admin/presentation/student_management_screen.dart';
import '../../features/school_admin/presentation/teacher_management_screen.dart';
import '../../features/school_admin/presentation/fees_management_screen.dart';
import '../../features/school_admin/presentation/classes_management_screen.dart';
import '../../features/principal/presentation/principal_dashboard.dart';
import '../../features/teacher/presentation/teacher_dashboard.dart';
import '../../features/teacher/presentation/mark_attendance_screen.dart';
import '../../features/teacher/presentation/homework_management_screen.dart';
import '../../features/student/presentation/student_dashboard.dart';
import '../../features/parent/presentation/parent_dashboard.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/notices/presentation/notices_management_screen.dart';
import '../../features/auth/domain/user_role.dart';

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;
  RouterNotifier(this._ref) {
    _ref.listen(authStateProvider, (_, __) => notifyListeners());
    _ref.listen(currentUserDataProvider, (_, __) => notifyListeners());
  }
}

final routerNotifierProvider = Provider((ref) => RouterNotifier(ref));

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider);

  return GoRouter(
    initialLocation: '/login',
    refreshListenable: notifier,
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SignupScreen(),
      ),
      
      // Common Routes
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/notices',
        name: 'notices',
        builder: (context, state) => const NoticesManagementScreen(),
      ),

      // Super Admin Routes
      GoRoute(
        path: '/admin',
        name: 'admin',
        builder: (context, state) => const SuperAdminDashboard(),
        routes: [
          GoRoute(
            path: 'schools',
            name: 'schools-list',
            builder: (context, state) => const SchoolsListScreen(),
          ),
          GoRoute(
            path: 'add-school',
            name: 'add-school',
            builder: (context, state) => const AddEditSchoolScreen(),
          ),
          GoRoute(
            path: 'revenue',
            name: 'revenue',
            builder: (context, state) => const RevenueScreen(),
          ),
          GoRoute(
            path: 'subscriptions',
            name: 'subscriptions',
            builder: (context, state) => const SubscriptionManagementScreen(),
          ),
          GoRoute(
            path: 'analytics',
            name: 'analytics',
            builder: (context, state) => const AnalyticsScreen(),
          ),
        ],
      ),

      // School Admin Routes
      GoRoute(
        path: '/school-admin',
        name: 'school-admin',
        builder: (context, state) => const SchoolAdminDashboard(),
        routes: [
          GoRoute(
            path: 'students',
            name: 'student-mgmt',
            builder: (context, state) => const StudentManagementScreen(),
          ),
          GoRoute(
            path: 'teachers',
            name: 'teacher-mgmt',
            builder: (context, state) => const TeacherManagementScreen(),
          ),
          GoRoute(
            path: 'fees',
            name: 'fees-mgmt',
            builder: (context, state) => const FeesManagementScreen(),
          ),
          GoRoute(
            path: 'classes',
            name: 'classes-mgmt',
            builder: (context, state) => const ClassesManagementScreen(),
          ),
        ],
      ),

      // Principal Routes
      GoRoute(
        path: '/principal',
        name: 'principal',
        builder: (context, state) => const PrincipalDashboard(),
      ),

      // Teacher Routes
      GoRoute(
        path: '/teacher',
        name: 'teacher',
        builder: (context, state) => const TeacherDashboard(),
        routes: [
          GoRoute(
            path: 'attendance',
            name: 'mark-attendance',
            builder: (context, state) => const MarkAttendanceScreen(),
          ),
          GoRoute(
            path: 'homework',
            name: 'homework-mgmt',
            builder: (context, state) => const HomeworkManagementScreen(),
          ),
        ],
      ),

      // Student Routes
      GoRoute(
        path: '/student',
        name: 'student',
        builder: (context, state) => const StudentDashboard(),
      ),

      // Parent Routes
      GoRoute(
        path: '/parent',
        name: 'parent',
        builder: (context, state) => const ParentDashboard(),
      ),
    ],
    redirect: (context, state) {
      final authState = ref.read(authStateProvider);
      final userData = ref.read(currentUserDataProvider);

      if (authState.isLoading) return null;

      final session = authState.value?.session;
      final isLoggingIn = state.matchedLocation == '/login';
      final isSigningUp = state.matchedLocation == '/signup';
      final isSplash = state.matchedLocation == '/splash';

      if (session == null) {
        if (isLoggingIn || isSigningUp || isSplash) return null;
        return '/login';
      }

      if (isLoggingIn || isSigningUp || isSplash) {
        if (userData.isLoading) return null;
        final user = userData.value;
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
      }
      return null;
    },
  );
});
