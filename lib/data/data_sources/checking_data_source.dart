import 'package:supabase_flutter/supabase_flutter.dart';

class CheckingDataSource {
  final SupabaseClient supabase;

  final FileOptions _fileOptions =
      const FileOptions(cacheControl: '3600', upsert: true);

  CheckingDataSource(this.supabase);

  Future<void> a({
    required String photo,
    required bool enter,
  }) async {
    await supabase.from('user_checks').insert({
      'user_id': supabase.auth.currentUser?.id,
      'photo': photo,
      'enter': enter,
    });
  }
}
