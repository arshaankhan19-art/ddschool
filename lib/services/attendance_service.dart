import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/attendance.dart';

class AttendanceService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<void> markAttendance(List<Attendance> attendanceList) async {
    final data = attendanceList.map((e) => {
      'student_id': e.studentId,
      'class_id': e.classId,
      'section_id': e.sectionId,
      'date': e.date.toIso8601String(),
      'status': e.status.name,
      'remarks': e.remarks,
    }).toList();

    await _client.from('attendance').upsert(data);
  }

  Future<List<Attendance>> getAttendanceForClass(String classId, String sectionId, DateTime date) async {
    final response = await _client
        .from('attendance')
        .select()
        .eq('class_id', classId)
        .eq('section_id', sectionId)
        .eq('date', date.toIso8601String().split('T')[0]);
    
    return (response as List).map((e) => Attendance.fromMap(e)).toList();
  }
}
