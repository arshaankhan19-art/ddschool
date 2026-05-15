import 'package:flutter/material.dart';
import 'package:ddschool/features/teacher/screens/teacher_home.dart';
import 'package:ddschool/features/teacher/screens/teacher_attendance.dart';
import 'package:ddschool/features/teacher/screens/teacher_homework.dart';
import 'package:ddschool/features/teacher/screens/teacher_students.dart';
import 'package:ddschool/features/parent/screens/parent_profile.dart'; // Reusing profile for now or create teacher specific

class TeacherDashboard extends StatefulWidget {
  const TeacherDashboard({super.key});

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const TeacherHomeScreen(),
    const TeacherAttendanceScreen(),
    const TeacherHomeworkScreen(),
    const TeacherStudentsScreen(),
    const ParentProfileScreen(), // Generic profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), activeIcon: Icon(Icons.dashboard), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.how_to_reg_outlined), activeIcon: Icon(Icons.how_to_reg), label: 'Attendance'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), activeIcon: Icon(Icons.assignment), label: 'Homework'),
          BottomNavigationBarItem(icon: Icon(Icons.groups_outlined), activeIcon: Icon(Icons.groups), label: 'Students'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
