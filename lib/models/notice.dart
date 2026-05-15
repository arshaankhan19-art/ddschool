class Notice {
  final String id;
  final String schoolId;
  final String title;
  final String content;
  final String? targetRole; // e.g., 'teacher', 'student', 'all'
  final DateTime createdAt;

  Notice({
    required this.id,
    required this.schoolId,
    required this.title,
    required this.content,
    this.targetRole,
    required this.createdAt,
  });

  factory Notice.fromMap(Map<String, dynamic> map) {
    return Notice(
      id: map['id'] as String,
      schoolId: map['school_id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      targetRole: map['target_role'] as String?,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }
}
