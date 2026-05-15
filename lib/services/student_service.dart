import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/student.dart';

class StudentService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getStudentsWithProfiles({String? schoolId}) async {
    var query = _client
        .from('students')
        .select('''
          *,
          users (
            full_name,
            email
          ),
          classes (
            name
          ),
          sections (
            name
          )
        ''');
    
    if (schoolId != null) {
      query = query.eq('school_id', schoolId);
    }

    final response = await query;
    return List<Map<String, dynamic>>.from(response);
  }

  Future<void> addStudent(Map<String, dynamic> data) async {
    await _client.from('students').insert(data);
  }

  Future<void> updateStudent(String id, Map<String, dynamic> data) async {
    await _client.from('students').update(data).eq('id', id);
  }

  Future<void> deleteStudent(String id) async {
    await _client.from('students').delete().eq('id', id);
  }
}
