import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';
import 'package:ddschool/core/constants.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

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
              _buildAttendanceCard(),
              const SizedBox(height: 24),
              _buildSectionTitle('Today\'s Schedule'),
              const SizedBox(height: 12),
              _buildTimetable(),
              const SizedBox(height: 24),
              _buildSectionTitle('My Homework'),
              const SizedBox(height: 12),
              _buildHomeworkPreview(),
              const SizedBox(height: 24),
              _buildSectionTitle('School Gallery'),
              const SizedBox(height: 12),
              _buildGalleryPreview(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final student = MockData.studentProfile;
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(student['photoUrl']),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello,', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
            Text(student['name'], style: const TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_outlined, color: AppColors.textPrimary),
        ),
      ],
    );
  }

  Widget _buildAttendanceCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Monthly Attendance', style: TextStyle(color: Colors.white70, fontSize: 14)),
              SizedBox(height: 4),
              Text('92%', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(12)),
            child: const Text('View Report', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary));
  }

  Widget _buildTimetable() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: [
          _buildTimetableItem('09:00 AM', 'Mathematics', 'Room 102', true),
          const Divider(height: 24, color: AppColors.divider),
          _buildTimetableItem('10:00 AM', 'Physics', 'Lab 1', false),
          const Divider(height: 24, color: AppColors.divider),
          _buildTimetableItem('11:00 AM', 'English', 'Room 105', false),
        ],
      ),
    );
  }

  Widget _buildTimetableItem(String time, String subject, String room, bool isActive) {
    return Row(
      children: [
        Text(time, style: TextStyle(color: isActive ? AppColors.primary : AppColors.textSecondary, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(subject, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(room, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
            ],
          ),
        ),
        if (isActive) Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
      ],
    );
  }

  Widget _buildHomeworkPreview() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.divider),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Mathematics', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(height: 4),
                const Text('Chapter 4 Quiz', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Text('Due Tomorrow', style: TextStyle(color: Colors.red.shade400, fontSize: 11)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildGalleryPreview() {
    return Row(
      children: [
        Expanded(child: _buildGalleryImage('https://images.unsplash.com/photo-1546410531-bb4caa6b424d?w=200')),
        const SizedBox(width: 10),
        Expanded(child: _buildGalleryImage('https://images.unsplash.com/photo-1509062522246-3755977927d7?w=200')),
      ],
    );
  }

  Widget _buildGalleryImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(url, height: 100, fit: BoxFit.cover),
    );
  }
}
