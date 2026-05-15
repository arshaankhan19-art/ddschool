import 'package:flutter/material.dart';
import 'package:ddschool/core/constants.dart';
import 'package:ddschool/features/parent/parent_dashboard.dart';
import 'package:ddschool/features/teacher/teacher_dashboard.dart';
import 'package:ddschool/features/student/student_dashboard.dart';
import 'package:ddschool/features/principal/principal_dashboard.dart';
import 'package:ddschool/features/admin/admin_dashboard.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    // Basic role routing (dummy)
    switch (MockData.currentUserRole) {
      case UserRole.parent:
        return const ParentDashboard();
      case UserRole.teacher:
        return const TeacherDashboard();
      case UserRole.student:
        return const StudentDashboard();
      case UserRole.principal:
        return const PrincipalDashboard();
      case UserRole.superAdmin:
        return const AdminDashboard();
      default:
        return const ParentDashboard();
    }
  }
}
