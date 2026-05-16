import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 32),
              _buildClassCard(),
              const SizedBox(height: 32),
              _buildSectionHeader('Today\'s Schedule'),
              const SizedBox(height: 16),
              _buildTimetable(),
              const SizedBox(height: 32),
              _buildSectionHeader('Pending Tasks'),
              const SizedBox(height: 16),
              _buildPendingTasks(),
              const SizedBox(height: 32),
              _buildSectionHeader('Quick Actions'),
              const SizedBox(height: 16),
              _buildQuickActions(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good Morning,', style: TextStyle(color: AppColors.textSecondary, fontSize: 16, fontWeight: FontWeight.w500)),
            const Text('Ms. Anjali', style: TextStyle(color: AppColors.textPrimary, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: -0.5)),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEEEEEE)),
          ),
          child: const Icon(Icons.calendar_today_rounded, color: AppColors.primary, size: 22),
        ),
      ],
    );
  }

  Widget _buildClassCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('CURRENT CLASS', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(8)),
                child: const Text('LIVE', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold, fontSize: 10)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Mathematics - 8A', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text('Room 402 • 10:30 AM - 11:15 AM', style: TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              child: const Text('Mark Attendance', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary));
  }

  Widget _buildTimetable() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        children: [
          _buildTimetableItem('11:30 AM', 'Algebra Review', '8B', false),
          const Divider(height: 32, color: Color(0xFFF5F5F5)),
          _buildTimetableItem('01:00 PM', 'Geometry Basics', '7A', false),
        ],
      ),
    );
  }

  Widget _buildTimetableItem(String time, String topic, String className, bool isActive) {
    return Row(
      children: [
        Text(time, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.primary)),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(topic, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              Text('Class $className', style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPendingTasks() {
    final tasks = [
      {'title': 'Grade HW: 8A', 'desc': 'Quadratic Equations', 'icon': Icons.assignment_turned_in_rounded},
      {'title': 'Syllabus Update', 'desc': 'Term 2 Mathematics', 'icon': Icons.description_rounded},
    ];

    return Column(
      children: tasks.map((task) => Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFEEEEEE)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(14)),
              child: Icon(task['icon'] as IconData, color: AppColors.primary, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  Text(task['desc'] as String, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: AppColors.divider),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildQuickActions() {
    final actions = [
      {'icon': Icons.add_task_rounded, 'label': 'Add HW'},
      {'icon': Icons.campaign_rounded, 'label': 'Notice'},
      {'icon': Icons.event_note_rounded, 'label': 'Leave'},
      {'icon': Icons.insights_rounded, 'label': 'Result'},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: actions.map((action) => Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(action['icon'] as IconData, color: AppColors.textPrimary),
          ),
          const SizedBox(height: 10),
          Text(action['label'] as String, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      )).toList(),
    );
  }
}
