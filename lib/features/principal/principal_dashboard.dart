import 'package:flutter/material.dart';
import 'package:ddschool/features/principal/screens/principal_home.dart';
import 'package:ddschool/features/principal/screens/principal_attendance.dart';
import 'package:ddschool/features/principal/screens/principal_reports.dart';
import 'package:ddschool/features/parent/screens/parent_notice.dart';
import 'package:ddschool/features/parent/screens/parent_profile.dart';

class PrincipalDashboard extends StatefulWidget {
  const PrincipalDashboard({super.key});

  @override
  State<PrincipalDashboard> createState() => _PrincipalDashboardState();
}

class _PrincipalDashboardState extends State<PrincipalDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const PrincipalHomeScreen(),
    const PrincipalAttendanceScreen(),
    const PrincipalReportsScreen(),
    const ParentNoticeScreen(), // Reusing notice
    const ParentProfileScreen(), // Reusing profile
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
          BottomNavigationBarItem(icon: Icon(Icons.analytics_outlined), activeIcon: Icon(Icons.analytics), label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.campaign_outlined), activeIcon: Icon(Icons.campaign), label: 'Notices'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
