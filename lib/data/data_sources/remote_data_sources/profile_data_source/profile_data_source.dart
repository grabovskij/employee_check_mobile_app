import 'package:mobile_app/data/data_sources/remote_data_sources/profile_data_source/transfer_objects/profile_transfer_object.dart';
import 'package:mobile_app/domain/profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Константы для работы с таблицей
const String _tableName = 'profiles';

class ProfileDataSource {
  final SupabaseClient _supabase;

  ProfileDataSource(this._supabase);

  Future<Profile> getProfile() async {
    final response = await _supabase.from(_tableName).select();

    if (response.isEmpty) {
      throw 'У пользователя не создан профиль';
    }

    return ProfileTransferObject.fromJson(response.first).toEntity();
  }
}
