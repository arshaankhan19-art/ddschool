import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/notice.dart';

class NoticeService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<Notice>> getNotices(String schoolId) async {
    final response = await _client
        .from('notices')
        .select()
        .eq('school_id', schoolId)
        .order('created_at', ascending: false);
    
    return (response as List).map((e) => Notice.fromMap(e)).toList();
  }

  Future<void> addNotice(Notice notice) async {
    await _client.from('notices').insert({
      'school_id': notice.schoolId,
      'title': notice.title,
      'content': notice.content,
      'target_role': notice.targetRole,
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  Future<void> deleteNotice(String id) async {
    await _client.from('notices').delete().eq('id', id);
  }
}
