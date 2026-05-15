class AppClass {
  final String id;
  final String schoolId;
  final String name;

  AppClass({
    required this.id,
    required this.schoolId,
    required this.name,
  });

  factory AppClass.fromMap(Map<String, dynamic> map) {
    return AppClass(
      id: map['id'] as String,
      schoolId: map['school_id'] as String,
      name: map['name'] as String,
    );
  }
}
