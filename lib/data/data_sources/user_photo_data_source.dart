import 'dart:io';

import 'package:mobile_app/configuration/environment.dart';
import 'package:mobile_app/core/utils/generation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserPhotoDataSource {
  final SupabaseClient supabase;

  final FileOptions _fileOptions =
      const FileOptions(cacheControl: '3600', upsert: true);

  UserPhotoDataSource(this.supabase);

  Future<String> uploadPhoto(File photo) async {
    final uploadFileName = '${getRandomString()}.png';
    final String path = await supabase.storage
        .from('photos')
        .upload(uploadFileName, photo, fileOptions: _fileOptions);

    return path;

    return '${Env.supabaseConfig.url}/storage/v1/object/public/$path';
  }
}
