class School {
  final String id;
  final String name;
  final String? address;
  final String? phone;
  final String? email;
  final String? subscriptionStatus;
  final DateTime? createdAt;

  School({
    required this.id,
    required this.name,
    this.address,
    this.phone,
    this.email,
    this.subscriptionStatus,
    this.createdAt,
  });

  factory School.fromMap(Map<String, dynamic> map) {
    return School(
      id: map['id'] as String,
      name: map['name'] as String,
      address: map['address'] as String?,
      phone: map['phone'] as String?,
      email: map['email'] as String?,
      subscriptionStatus: map['subscription_status'] as String?,
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      'subscription_status': subscriptionStatus,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
