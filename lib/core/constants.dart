enum UserRole {
  superAdmin,
  principal,
  teacher,
  parent,
  student,
}

class MockData {
  static const UserRole currentUserRole = UserRole.parent; // Change this to test different roles

  static const String schoolName = "DD School";
  
  static const Map<String, dynamic> studentProfile = {
    "name": "Aryan Sharma",
    "class": "Class 8",
    "section": "A",
    "rollNo": "24",
    "attendance": "92%",
    "pendingHomework": 3,
    "feeDue": "₹12,500",
    "upcomingExam": "Mathematics - 15 Oct",
    "photoUrl": "https://api.dicebear.com/7.x/avataaars/svg?seed=Aryan",
  };

  static const List<Map<String, dynamic>> homework = [
    {"subject": "Mathematics", "description": "Solve exercises 4.1 to 4.3 from NCERT textbook.", "date": "Oct 12, 2023", "status": "Pending"},
    {"subject": "Science", "description": "Draw and label the human digestive system.", "date": "Oct 11, 2023", "status": "Submitted"},
    {"subject": "English", "description": "Write an essay on 'The Importance of Education'.", "date": "Oct 10, 2023", "status": "Submitted"},
  ];

  static const List<Map<String, dynamic>> notices = [
    {"title": "Diwali Vacation", "content": "School will remain closed from Nov 10 to Nov 20 for Diwali holidays.", "date": "Oct 08, 2023", "type": "Holiday"},
    {"title": "Parent-Teacher Meeting", "content": "PTM for Class 1-10 will be held on Oct 25 in the school auditorium.", "date": "Oct 05, 2023", "type": "Event"},
    {"title": "Half Yearly Exams", "content": "The date sheet for half-yearly exams has been uploaded to the portal.", "date": "Oct 01, 2023", "type": "Exam"},
  ];

  static const List<Map<String, dynamic>> fees = [
    {"term": "Quarter 1", "amount": "₹15,000", "status": "Paid", "date": "Apr 10, 2023"},
    {"term": "Quarter 2", "amount": "₹15,000", "status": "Pending", "date": "Jul 10, 2023"},
  ];
}
