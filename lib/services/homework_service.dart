import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/homework.dart';

class HomeworkService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<Homework>> getHomeworkForClass(String classId, String sectionId) async {
    final response = await _client
        .from('homework')
        .select()
        .eq('class_id', classId)
        .eq('section_id', sectionId)
        .order('created_at', ascending: false);
    
    return (response as List).map((e) => Homework.fromMap(e)).toList();
  }

  Future<void> assignHomework(Homework homework) async {
    await _client.from('homework').insert({
      'school_id': homework.schoolId,
      'class_id': homework.classId,
      'section_id': homework.sectionId,
      'teacher_id': homework.teacherId,
      'title': homework.title,
      'description': homework.description,
      'due_date': homework.dueDate.toIso8601String(),
      'created_at': DateTime.now().toIso8601String(),
    });
  }
}
