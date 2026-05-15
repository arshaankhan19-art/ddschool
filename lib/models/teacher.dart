class Teacher {
  final String id;
  final String userId;
  final String schoolId;
  final List<String>? subjectIds;

  Teacher({
    required this.id,
    required this.userId,
    required this.schoolId,
    this.subjectIds,
  });

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
      id: map['id'] as String,
      userId: map['user_id'] as String,
      schoolId: map['school_id'] as String,
      subjectIds: map['subject_ids'] != null ? List<String>.from(map['subject_ids']) : null,
    );
  }
}
