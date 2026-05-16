import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';

class StudentTimetableScreen extends StatefulWidget {
  const StudentTimetableScreen({super.key});

  @override
  State<StudentTimetableScreen> createState() => _StudentTimetableScreenState();
}

class _StudentTimetableScreenState extends State<StudentTimetableScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _days.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Class Timetable', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text('Class 10 - A • Session 2023-24', 
              style: TextStyle(fontSize: 12, color: AppColors.textSecondary.withOpacity(0.8), fontWeight: FontWeight.w500)),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.primary.withOpacity(0.2)),
            ),
            child: const Text('CBSE', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1)),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          indicatorColor: AppColors.primary,
          indicatorWeight: 3,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondary,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          tabs: _days.map((day) => Tab(text: day)).toList(),
        ),
      ),
      body: Column(
        children: [
          _buildSummaryCard(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _days.map((day) => _buildDayTimetable(day)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildSummaryItem('8', 'Classes'),
          Container(width: 1, height: 40, color: Colors.white24),
          _buildSummaryItem('92%', 'Attnd.'),
          Container(width: 1, height: 40, color: Colors.white24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('Next: Mathematics', 
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                  overflow: TextOverflow.ellipsis),
                Text('at 10:00 AM', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String value, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          Text(label, style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 10, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildDayTimetable(String day) {
    final List<Map<String, dynamic>> periods = [
      {'id': 'P1', 'subject': 'Mathematics', 'teacher': 'Mrs. Sharma', 'room': '102', 'time': '08:00 - 08:40', 'isOngoing': true},
      {'id': 'P2', 'subject': 'English Core', 'teacher': 'Ms. Anjali', 'room': '102', 'time': '08:40 - 09:20'},
      {'id': 'P3', 'subject': 'Science (Phy)', 'teacher': 'Mr. Khanna', 'room': 'Lab 1', 'time': '09:20 - 10:00'},
      {'id': 'P4', 'subject': 'Social Science', 'teacher': 'Mrs. Verma', 'room': '102', 'time': '10:00 - 10:40'},
      {'type': 'break', 'title': 'Break Time', 'time': '10:40 - 11:00'},
      {'id': 'P5', 'subject': 'Hindi', 'teacher': 'Mr. Pandey', 'room': '105', 'time': '11:00 - 11:40'},
      {'id': 'P6', 'subject': 'Computer Sci.', 'teacher': 'Ms. Gupta', 'room': 'CS Lab', 'time': '11:40 - 12:20'},
      {'id': 'P7', 'subject': 'Physical Edu.', 'teacher': 'Mr. Rawat', 'room': 'Ground', 'time': '12:20 - 01:00'},
      {'id': 'P8', 'subject': 'Art & Craft', 'teacher': 'Mrs. Das', 'room': 'Studio', 'time': '01:00 - 01:40'},
    ];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: periods.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final period = periods[index];
        if (period['type'] == 'break') {
          return _buildBreakCard(period);
        }
        return _buildPeriodCard(period);
      },
    );
  }

  Widget _buildPeriodCard(Map<String, dynamic> period) {
    bool isOngoing = period['isOngoing'] ?? false;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: isOngoing ? AppColors.primary : const Color(0xFFEEEEEE), width: isOngoing ? 2 : 1),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 50,
              decoration: BoxDecoration(
                color: isOngoing ? AppColors.primary : AppColors.primary.withOpacity(0.05),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(22), bottomLeft: Radius.circular(22)),
              ),
              child: Center(
                child: Text(
                  period['id'],
                  style: TextStyle(
                    color: isOngoing ? Colors.white : AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(period['subject'], 
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.textPrimary),
                            overflow: TextOverflow.ellipsis),
                        ),
                        if (isOngoing) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(6)),
                            child: const Text('ONGOING', style: TextStyle(color: AppColors.textPrimary, fontSize: 8, fontWeight: FontWeight.bold)),
                          ),
                        ]
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(period['teacher'], style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 12, color: AppColors.primary),
                        const SizedBox(width: 4),
                        Text('Room: ${period['room']}', style: const TextStyle(fontSize: 11, color: AppColors.primary, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: Text(
                  period['time'].split(' - ').join('\n'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 10, color: AppColors.textSecondary, fontWeight: FontWeight.bold, height: 1.4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBreakCard(Map<String, dynamic> period) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.coffee_rounded, color: AppColors.primary, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Break Time', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primary)),
                Text(period['time'], style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const Icon(Icons.auto_awesome_rounded, color: AppColors.accent, size: 20),
        ],
      ),
    );
  }
}
