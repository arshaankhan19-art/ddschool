class StudentFee {
  final String id;
  final String studentId;
  final String feeStructureId;
  final double amountPaid;
  final double dueAmount;
  final DateTime? paymentDate;
  final String status; // 'paid', 'partial', 'unpaid'

  StudentFee({
    required this.id,
    required this.studentId,
    required this.feeStructureId,
    required this.amountPaid,
    required this.dueAmount,
    this.paymentDate,
    required this.status,
  });

  factory StudentFee.fromMap(Map<String, dynamic> map) {
    return StudentFee(
      id: map['id'] as String,
      studentId: map['student_id'] as String,
      feeStructureId: map['fee_structure_id'] as String,
      amountPaid: (map['amount_paid'] as num).toDouble(),
      dueAmount: (map['due_amount'] as num).toDouble(),
      paymentDate: map['payment_date'] != null ? DateTime.parse(map['payment_date']) : null,
      status: map['status'] as String,
    );
  }
}
