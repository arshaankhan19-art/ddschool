enum UserRole {
  superAdmin('super_admin'),
  schoolAdmin('school_admin'),
  principal('principal'),
  teacher('teacher'),
  student('student'),
  parent('parent'),
  unknown('unknown');

  final String value;
  const UserRole(this.value);

  static UserRole fromString(String? role) {
    return UserRole.values.firstWhere(
      (e) => e.value == role,
      orElse: () => UserRole.unknown,
    );
  }
}
