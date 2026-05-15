enum AttendanceStatus { present, absent, late, halfDay }

class Attendance {
  final String id;
  final String studentId;
  final String classId;
  final String sectionId;
  final DateTime date;
  final AttendanceStatus status;
  final String? remarks;

  Attendance({
    required this.id,
    required this.studentId,
    required this.classId,
    required this.sectionId,
    required this.date,
    required this.status,
    this.remarks,
  });

  factory Attendance.fromMap(Map<String, dynamic> map) {
    return Attendance(
      id: map['id'] as String,
      studentId: map['student_id'] as String,
      classId: map['class_id'] as String,
      sectionId: map['section_id'] as String,
      date: DateTime.parse(map['date'] as String),
      status: AttendanceStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => AttendanceStatus.absent,
      ),
      remarks: map['remarks'] as String?,
    );
  }
}
