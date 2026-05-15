import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/school.dart';

class SchoolService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<School>> getSchools() async {
    final response = await _client.from('schools').select().order('name');
    return (response as List).map((e) => School.fromMap(e)).toList();
  }

  Future<void> addSchool(School school) async {
    await _client.from('schools').insert(school.toMap());
  }

  Future<void> updateSchool(School school) async {
    await _client.from('schools').update(school.toMap()).eq('id', school.id);
  }

  Future<void> deleteSchool(String id) async {
    await _client.from('schools').delete().eq('id', id);
  }
}
