class TimetableEntry {
  final String id;
  final String schoolId;
  final String classId;
  final String sectionId;
  final String subjectName;
  final String teacherName;
  final String dayOfWeek; // 'Monday', 'Tuesday', etc.
  final String startTime; // '08:00'
  final String endTime;   // '09:00'
  final String? roomNumber;

  TimetableEntry({
    required this.id,
    required this.schoolId,
    required this.classId,
    required this.sectionId,
    required this.subjectName,
    required this.teacherName,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
    this.roomNumber,
  });

  factory TimetableEntry.fromMap(Map<String, dynamic> map) {
    return TimetableEntry(
      id: map['id'] as String,
      schoolId: map['school_id'] as String,
      classId: map['class_id'] as String,
      sectionId: map['section_id'] as String,
      subjectName: map['subject_name'] as String,
      teacherName: map['teacher_name'] as String,
      dayOfWeek: map['day_of_week'] as String,
      startTime: map['start_time'] as String,
      endTime: map['end_time'] as String,
      roomNumber: map['room_number'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'school_id': schoolId,
      'class_id': classId,
      'section_id': sectionId,
      'subject_name': subjectName,
      'teacher_name': teacherName,
      'day_of_week': dayOfWeek,
      'start_time': startTime,
      'end_time': endTime,
      'room_number': roomNumber,
    };
  }
}
