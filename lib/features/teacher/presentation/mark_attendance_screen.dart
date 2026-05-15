import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/snackbar_helper.dart';
import '../../../models/attendance.dart';

class MarkAttendanceScreen extends ConsumerStatefulWidget {
  const MarkAttendanceScreen({super.key});

  @override
  ConsumerState<MarkAttendanceScreen> createState() => _MarkAttendanceScreenState();
}

class _MarkAttendanceScreenState extends ConsumerState<MarkAttendanceScreen> {
  DateTime _selectedDate = DateTime.now();
  String? _selectedClass = 'Grade 10';
  String? _selectedSection = 'Section A';

  // Mock student list
  final List<Map<String, dynamic>> _students = List.generate(
    20,
    (index) => {
      'id': 'std_$index',
      'name': 'Student Name ${index + 1}',
      'status': AttendanceStatus.present,
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Mark Attendance', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildFilters(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _students.length,
              itemBuilder: (context, index) {
                final student = _students[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(student['name']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _statusChip(index, AttendanceStatus.present, Colors.green),
                        const SizedBox(width: 8),
                        _statusChip(index, AttendanceStatus.absent, Colors.red),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomButton(
              text: 'Submit Attendance',
              onPressed: () {
                SnackbarHelper.showSuccess(context, 'Attendance submitted successfully');
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.calendar_month_outlined, color: AppTheme.primaryColor),
              const SizedBox(width: 12),
              Text(
                'Date: ${_selectedDate.toString().split(' ')[0]}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) setState(() => _selectedDate = date);
                },
                child: const Text('Change'),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                  value: _selectedClass,
                  isExpanded: true,
                  underline: const SizedBox(),
                  items: ['Grade 10', 'Grade 11'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (v) => setState(() => _selectedClass = v),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: DropdownButton<String>(
                  value: _selectedSection,
                  isExpanded: true,
                  underline: const SizedBox(),
                  items: ['Section A', 'Section B'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (v) => setState(() => _selectedSection = v),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statusChip(int index, AttendanceStatus status, Color color) {
    bool isSelected = _students[index]['status'] == status;
    return GestureDetector(
      onTap: () => setState(() => _students[index]['status'] = status),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? color : color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color),
        ),
        child: Text(
          status == AttendanceStatus.present ? 'P' : 'A',
          style: TextStyle(
            color: isSelected ? Colors.white : color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
