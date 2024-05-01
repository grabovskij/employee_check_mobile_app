import 'package:mobile_app/data/extension/report_to_entity.dart';
import 'package:mobile_app/data/transfer_objects/report_to.dart';
import 'package:mobile_app/domain/report.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CheckingDataSource {
  final SupabaseClient supabase;

  CheckingDataSource(this.supabase);

  Future<void> makeEmployeeCheck({
    required String photo,
    required bool isEnter,
  }) async {
    await supabase.from('user_checks').insert({
      'user_id': supabase.auth.currentUser?.id,
      'photo': photo,
      'enter': isEnter,
    });
  }

  Future<List<Report>> getReports() async {
    final results = await supabase.from('user_checks').select().eq('user_id', supabase.auth.currentUser?.id ?? '');

    return results.map((json) => ReportTO.fromJson(json).toEntity()).toList();
  }
}
