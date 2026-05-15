class FeeStructure {
  final String id;
  final String schoolId;
  final String classId;
  final String feeName;
  final double amount;
  final String? frequency; // monthly, yearly, one-time

  FeeStructure({
    required this.id,
    required this.schoolId,
    required this.classId,
    required this.feeName,
    required this.amount,
    this.frequency,
  });

  factory FeeStructure.fromMap(Map<String, dynamic> map) {
    return FeeStructure(
      id: map['id'] as String,
      schoolId: map['school_id'] as String,
      classId: map['class_id'] as String,
      feeName: map['fee_name'] as String,
      amount: (map['amount'] as num).toDouble(),
      frequency: map['frequency'] as String?,
    );
  }
}
