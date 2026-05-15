import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildTimetablePreview(),
              const SizedBox(height: 24),
              _buildSectionTitle('Pending Tasks'),
              const SizedBox(height: 12),
              _buildPendingTasks(),
              const SizedBox(height: 24),
              _buildSectionTitle('Quick Actions'),
              const SizedBox(height: 12),
              _buildQuickActions(),
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
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good Morning,', style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
            Text('Ms. Anjali', style: TextStyle(color: AppColors.textPrimary, fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.divider)),
          child: const Icon(Icons.calendar_today, color: AppColors.primary, size: 20),
        ),
      ],
    );
  }

  Widget _buildTimetablePreview() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Next Class', style: TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 8),
          const Text('Mathematics - Class 8A', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text('10:30 AM - 11:15 AM (Room 402)', style: TextStyle(color: Colors.white60, fontSize: 14)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
            child: const Text('Mark Attendance'),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary));
  }

  Widget _buildPendingTasks() {
    final tasks = [
      {'title': 'Grade Science Homework', 'subtitle': 'Class 7B - 32 submissions', 'icon': Icons.edit_note},
      {'title': 'Upload Syllabus', 'subtitle': 'Term 2 - Class 8', 'icon': Icons.upload_file},
    ];

    return Column(
      children: tasks.map((task) => Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.divider)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
              child: Icon(task['icon'] as IconData, color: AppColors.primary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(task['subtitle'] as String, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.divider),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildQuickActions() {
    final actions = [
      {'icon': Icons.add_task, 'label': 'Add HW'},
      {'icon': Icons.campaign, 'label': 'Notice'},
      {'icon': Icons.event_available, 'label': 'Leave'},
      {'icon': Icons.analytics, 'label': 'Result'},
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: actions.map((action) => Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.divider)),
            child: Icon(action['icon'] as IconData, color: AppColors.primary),
          ),
          const SizedBox(height: 8),
          Text(action['label'] as String, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
        ],
      )).toList(),
    );
  }
}
