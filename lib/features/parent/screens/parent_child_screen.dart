import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';
import 'package:ddschool/core/constants.dart';

class ParentChildScreen extends StatefulWidget {
  const ParentChildScreen({super.key});

  @override
  State<ParentChildScreen> createState() => _ParentChildScreenState();
}

class _ParentChildScreenState extends State<ParentChildScreen> {
  int _selectedChildIndex = 0;

  final List<Map<String, dynamic>> _children = [
    {
      "name": "Aryan Sharma",
      "class": "10-A",
      "rollNo": "21",
      "admissionNo": "DD/2023/1042",
      "studentId": "STU-2201",
      "photo": "https://api.dicebear.com/7.x/avataaars/svg?seed=Aryan",
      "attendance": "92%",
      "fees": "Paid",
      "performance": "A Grade",
      "gpa": "8.4",
      "pendingHW": "3",
      "dueFees": "₹0",
    },
    {
      "name": "Ananya Sharma",
      "class": "6-B",
      "rollNo": "08",
      "admissionNo": "DD/2023/2155",
      "studentId": "STU-4402",
      "photo": "https://api.dicebear.com/7.x/avataaars/svg?seed=Ananya",
      "attendance": "95%",
      "fees": "Pending",
      "performance": "A+ Grade",
      "gpa": "9.2",
      "pendingHW": "1",
      "dueFees": "₹4,500",
    }
  ];

  @override
  Widget build(BuildContext context) {
    final child = _children[_selectedChildIndex];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('My Child', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildChildSelector(),
            const SizedBox(height: 24),
            _buildChildProfileHero(child),
            const SizedBox(height: 24),
            _buildQuickOverviewGrid(child),
            const SizedBox(height: 32),
            _buildSectionTitle("Academic Performance"),
            const SizedBox(height: 16),
            _buildPerformanceSection(),
            const SizedBox(height: 32),
            _buildSectionTitle("Monthly Attendance"),
            const SizedBox(height: 16),
            _buildAttendanceSection(child),
            const SizedBox(height: 32),
            _buildSectionTitle("Recent School Activity"),
            const SizedBox(height: 16),
            _buildActivityFeed(),
            const SizedBox(height: 32),
            _buildSectionTitle("Upcoming Events"),
            const SizedBox(height: 16),
            _buildUpcomingEvents(),
            const SizedBox(height: 32),
            _buildQuickActions(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildChildSelector() {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _children.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          bool isSelected = _selectedChildIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedChildIndex = index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: isSelected ? AppColors.primary : const Color(0xFFEEEEEE)),
                boxShadow: isSelected ? [BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4))] : null,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(_children[index]['photo']),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _children[index]['name'],
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Class ${_children[index]['class']}',
                        style: TextStyle(
                          color: isSelected ? Colors.white70 : AppColors.textSecondary,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildChildProfileHero(Map<String, dynamic> child) {
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
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withOpacity(0.2), width: 4),
                ),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(child['photo']),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      child['name'],
                      style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Class ${child['class']} • Roll No ${child['rollNo']}',
                      style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeroStat('Admission No', child['admissionNo']),
                Container(width: 1, height: 30, color: Colors.white24),
                _buildHeroStat('Student ID', child['studentId']),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildQuickBadge(Icons.calendar_today_rounded, 'Attendance', child['attendance']),
              _buildQuickBadge(Icons.payments_rounded, 'Fees', child['fees']),
              _buildQuickBadge(Icons.trending_up_rounded, 'Result', child['performance']),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeroStat(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildQuickBadge(IconData icon, String label, String value) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: AppColors.accent, shape: BoxShape.circle),
          child: Icon(icon, color: AppColors.textPrimary, size: 16),
        ),
        const SizedBox(height: 6),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
        Text(label, style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 10)),
      ],
    );
  }

  Widget _buildQuickOverviewGrid(Map<String, dynamic> child) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.2, // Changed from 1.4 to 1.2 to fix overflow
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _buildStatCard('Attendance', child['attendance'], Icons.how_to_reg_rounded, Colors.blue),
        _buildStatCard('Report Card', 'Mid-Term: ${child['gpa']}', Icons.description_rounded, Colors.orange),
        _buildStatCard('Homework', '${child['pendingHW']} Pending', Icons.assignment_rounded, Colors.purple),
        _buildStatCard('Fee Status', child['dueFees'] == '₹0' ? 'Paid' : 'Due: ${child['dueFees']}', Icons.payments_rounded, Colors.redAccent),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 8), // Reduced from 12 to 8
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary)),
          ),
          const SizedBox(height: 2),
          Text(title, style: const TextStyle(color: AppColors.textSecondary, fontSize: 11, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildPerformanceSection() {
    final subjects = [
      {"name": "Mathematics", "percent": 0.85, "color": Colors.blue},
      {"name": "Science", "percent": 0.88, "color": Colors.green},
      {"name": "English", "percent": 0.79, "color": Colors.orange},
      {"name": "Hindi", "percent": 0.90, "color": Colors.purple},
    ];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        children: subjects.map((sub) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(sub['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary)),
                  Text('${((sub['percent'] as double) * 100).toInt()}%', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: sub['color'] as Color)),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: sub['percent'] as double,
                  minHeight: 8,
                  backgroundColor: AppColors.background,
                  color: sub['color'] as Color,
                ),
              ),
            ],
          ),
        )).toList(),
      ),
    );
  }

  Widget _buildAttendanceSection(Map<String, dynamic> child) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: double.parse(child['attendance'].replaceAll('%', '')) / 100,
                  strokeWidth: 8,
                  backgroundColor: AppColors.background,
                  color: AppColors.primary,
                  strokeCap: StrokeCap.round,
                ),
                Text(child['attendance'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primary)),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              children: [
                _buildAttendanceRow('Present', '22 Days', Colors.green),
                const SizedBox(height: 12),
                _buildAttendanceRow('Absent', '02 Days', Colors.redAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceRow(String label, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, fontWeight: FontWeight.w500)),
          ],
        ),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary)),
      ],
    );
  }

  Widget _buildActivityFeed() {
    final activities = [
      {"title": "Mathematics homework assigned", "time": "1 hour ago", "icon": Icons.assignment_rounded, "color": Colors.blue},
      {"title": "PTM meeting scheduled for Saturday", "time": "3 hours ago", "icon": Icons.people_rounded, "color": Colors.orange},
      {"title": "Teacher remark: Excellent performance in Quiz", "time": "Yesterday", "icon": Icons.star_rounded, "color": Colors.amber},
    ];

    return Column(
      children: activities.map((act) => Container(
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
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: (act['color'] as Color).withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
              child: Icon(act['icon'] as IconData, color: act['color'] as Color, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(act['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary)),
                  Text(act['time'] as String, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                ],
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildUpcomingEvents() {
    final events = [
      {"title": "Mid Term Exams", "date": "15 Oct", "type": "Exam", "color": Colors.redAccent},
      {"title": "Annual Function", "date": "22 Nov", "type": "Function", "color": Colors.blue},
      {"title": "Diwali Break", "date": "10 Nov", "type": "Holiday", "color": Colors.orange},
    ];

    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final event = events[index];
          return Container(
            width: 160,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFEEEEEE)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(event['date'] as String, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: event['color'] as Color)),
                const SizedBox(height: 4),
                Text(event['title'] as String, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.textPrimary)),
                Text(event['type'] as String, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary, fontWeight: FontWeight.w600)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      children: [
        _buildActionRow(Icons.description_rounded, "View Full Report Card"),
        const SizedBox(height: 12),
        _buildActionRow(Icons.file_download_rounded, "Download Progress Report"),
        const SizedBox(height: 12),
        _buildActionRow(Icons.calendar_month_rounded, "View Timetable"),
        const SizedBox(height: 12),
        _buildActionRow(Icons.assignment_rounded, "View Homework"),
      ],
    );
  }

  Widget _buildActionRow(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 22),
          const SizedBox(width: 16),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary)),
          const Spacer(),
          const Icon(Icons.chevron_right_rounded, color: AppColors.divider),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary));
  }
}
