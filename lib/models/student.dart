class Student {
  final String id;
  final String userId;
  final String schoolId;
  final String? classId;
  final String? sectionId;
  final String? rollNumber;
  final String? parentId;

  Student({
    required this.id,
    required this.userId,
    required this.schoolId,
    this.classId,
    this.sectionId,
    this.rollNumber,
    this.parentId,
  });

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as String,
      userId: map['user_id'] as String,
      schoolId: map['school_id'] as String,
      classId: map['class_id'] as String?,
      sectionId: map['section_id'] as String?,
      rollNumber: map['roll_number'] as String?,
      parentId: map['parent_id'] as String?,
    );
  }
}
