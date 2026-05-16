enum UserRole {
  superAdmin,
  principal,
  teacher,
  parent,
  student,
  admin, // School Admin
}

class PostCategory {
  static const String homework = 'Homework';
  static const String announcement = 'Announcement';
  static const String event = 'Event';
  static const String exam = 'Exam';
  static const String circular = 'Circular';
  static const String activity = 'Activity';
  static const String holiday = 'Holiday';
  static const String achievement = 'Achievement';

  static List<String> get all => [
    homework, announcement, event, exam, circular, activity, holiday, achievement
  ];
}

class MockData {
  static UserRole currentUserRole = UserRole.parent;

  static const String schoolName = "DD School";
  
  static const Map<String, dynamic> studentProfile = {
    "name": "Aryan Sharma",
    "class": "Class 8",
    "section": "A",
    "rollNo": "24",
    "attendance": "92%",
    "photoUrl": "https://api.dicebear.com/7.x/avataaars/svg?seed=Aryan",
  };

  static List<Map<String, dynamic>> feedPosts = [
    {
      "posterName": "Dr. Verma",
      "posterRole": "Principal",
      "posterAvatar": "https://api.dicebear.com/7.x/avataaars/svg?seed=Principal",
      "title": "PTM Meeting on Saturday",
      "description": "Dear Parents, we are organizing a Parent-Teacher Meeting this Saturday to discuss your child's progress in the mid-term exams. Your presence is highly appreciated.",
      "category": PostCategory.announcement,
      "date": "2 hours ago",
      "images": ["https://images.unsplash.com/photo-1524178232363-1fb2b075b655?w=800"],
      "isPinned": true,
    },
    {
      "posterName": "Ms. Anjali",
      "posterRole": "Teacher",
      "posterAvatar": "https://api.dicebear.com/7.x/avataaars/svg?seed=Anjali",
      "title": "Math Homework Chapter 4",
      "description": "Students, please complete the exercises 4.1 to 4.3 from your NCERT textbook. We will discuss the solutions in the next class.",
      "category": PostCategory.homework,
      "date": "4 hours ago",
      "images": ["https://images.unsplash.com/photo-1434030216411-0b793f4b4173?w=800"],
    },
    {
      "posterName": "Admin Office",
      "posterRole": "School Admin",
      "posterAvatar": "https://api.dicebear.com/7.x/avataaars/svg?seed=Admin",
      "title": "Annual Function Photos",
      "description": "The glimpses of our Annual Function 2023! It was a day filled with joy, talent, and unforgettable memories. Congratulations to all performers.",
      "category": PostCategory.event,
      "date": "Yesterday",
      "images": [
        "https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=800",
        "https://images.unsplash.com/photo-1511578314322-379afb476865?w=800"
      ],
    },
    {
      "posterName": "Ms. Sharma",
      "posterRole": "Teacher",
      "posterAvatar": "https://api.dicebear.com/7.x/avataaars/svg?seed=Sharma",
      "title": "Students won district competition",
      "description": "Proud moment for DD School! Our students secured the first position in the Inter-School Science Quiz Competition held at the District Level.",
      "category": PostCategory.achievement,
      "date": "2 days ago",
      "images": ["https://images.unsplash.com/photo-1523240795612-9a054b0db644?w=800"],
    },
  ];

  static const List<Map<String, dynamic>> homework = [
    {"subject": "Mathematics", "description": "Solve exercises 4.1 to 4.3 from NCERT textbook.", "date": "Oct 12, 2023", "status": "Pending"},
    {"subject": "Science", "description": "Draw and label the human digestive system.", "date": "Oct 11, 2023", "status": "Submitted"},
  ];

  static const List<Map<String, dynamic>> notices = [
    {
      "title": "Diwali Vacation", 
      "content": "The school will remain closed from November 10th to November 20th for Diwali holidays. We wish all our students and staff a very Happy and Safe Diwali. Classes will resume as per normal schedule from November 21st.", 
      "date": "Oct 08, 2023", 
      "type": "Holiday"
    },
    {
      "title": "Mid-Term Examination Schedule", 
      "content": "The date sheet for the upcoming Mid-Term examinations has been released. Exams will commence from October 15th. Detailed syllabus and guidelines have been uploaded to the student portal. Please ensure all dues are cleared before the exams.", 
      "date": "Oct 05, 2023", 
      "type": "Exam"
    },
    {
      "title": "Urgent: Parent-Teacher Meeting", 
      "content": "A mandatory Parent-Teacher Meeting is scheduled for Saturday, October 12th, from 9:00 AM to 12:30 PM. Parents are requested to come at their allotted time slots to discuss the academic performance of their wards.", 
      "date": "Oct 02, 2023", 
      "type": "Urgent"
    },
    {
      "title": "Inter-House Sports Meet", 
      "content": "The Annual Inter-House Sports Meet will be held on October 25th and 26th. Students interested in participating in track and field events should register their names with the PE teacher by Friday.", 
      "date": "Sep 28, 2023", 
      "type": "Event"
    },
    {
      "title": "New School Timing Circular", 
      "content": "As per the government directive regarding the changing weather, the school timings are being revised. Starting Monday, the school will begin at 8:30 AM instead of 8:00 AM. Departure time remains unchanged at 2:00 PM.", 
      "date": "Sep 25, 2023", 
      "type": "Circular"
    },
  ];

  static const List<Map<String, dynamic>> fees = [
    {"term": "Quarter 1", "amount": "₹15,000", "status": "Paid", "date": "Apr 10, 2023"},
    {"term": "Quarter 2", "amount": "₹15,000", "status": "Pending", "date": "Jul 10, 2023"},
  ];
}
