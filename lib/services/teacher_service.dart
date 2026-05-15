import 'package:supabase_flutter/supabase_flutter.dart';

class TeacherService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getTeachersWithProfiles({String? schoolId}) async {
    var query = _client.from('teachers').select('''
          *,
          users (
            full_name,
            email,
            phone
          )
        ''');

    if (schoolId != null) {
      query = query.eq('school_id', schoolId);
    }

    final response = await query;
    return List<Map<String, dynamic>>.from(response);
  }

  Future<void> addTeacher(Map<String, dynamic> data) async {
    await _client.from('teachers').insert(data);
  }
}
