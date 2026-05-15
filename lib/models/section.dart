class Section {
  final String id;
  final String classId;
  final String name;

  Section({
    required this.id,
    required this.classId,
    required this.name,
  });

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
      id: map['id'] as String,
      classId: map['class_id'] as String,
      name: map['name'] as String,
    );
  }
}
