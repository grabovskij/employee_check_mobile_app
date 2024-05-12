import 'package:mobile_app/core/utils/geolocator.dart';
import 'package:mobile_app/data/data_sources/local_data_sources/employee_reports_data_source/transfer_objects/report_transfer_object.dart';
import 'package:mobile_app/domain/report.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Reports table name = ['user_checks']
const String _tableName = 'user_checks';

// Table columns
const String _userId = 'user_id';
const String _photo = 'photo';
const String _enterStatus = 'enter';
const String _lat = 'lat';
const String _lon = 'lon';

typedef Reports = List<Report>;

class CheckingDataSource {
  final SupabaseClient _supabase;

  CheckingDataSource(this._supabase);

  Future<void> createEmployeeReport({
    required String photo,
    required bool enterStatus,
    required Geolocation geolocation,
  }) async {
    await _supabase.from(_tableName).insert({
      _userId: _supabase.auth.currentUser?.id,
      _photo: photo,
      _enterStatus: enterStatus,
      _lat: geolocation.latitude,
      _lon: geolocation.longitude,
    });
  }

  Future<Reports> getReports() async {
    final results = await _supabase.from(_tableName).select().eq(_userId, _supabase.auth.currentUser?.id ?? '');

    return results.map((json) => ReportTransferObject.fromJson(json).toEntity()).toList();
  }
}
