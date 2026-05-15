class Homework {
  final String id;
  final String schoolId;
  final String classId;
  final String sectionId;
  final String teacherId;
  final String title;
  final String description;
  final DateTime dueDate;
  final DateTime createdAt;

  Homework({
    required this.id,
    required this.schoolId,
    required this.classId,
    required this.sectionId,
    required this.teacherId,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.createdAt,
  });

  factory Homework.fromMap(Map<String, dynamic> map) {
    return Homework(
      id: map['id'] as String,
      schoolId: map['school_id'] as String,
      classId: map['class_id'] as String,
      sectionId: map['section_id'] as String,
      teacherId: map['teacher_id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      dueDate: DateTime.parse(map['due_date'] as String),
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }
}
