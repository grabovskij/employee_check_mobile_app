import 'dart:io';

import 'package:mobile_app/core/utils/generation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Константы с именами бакетов
const String _photosBucketName = 'photos';

class FilesDataSource {
  final FileOptions _fileUploadOptions = const FileOptions(cacheControl: '3600', upsert: true);
  final SupabaseClient _supabase;

  FilesDataSource(this._supabase);

  String get _randomPhotoFileName => '${getRandomString()}.png';

  /// При успешной загрузке возвращает путь к файлу.
  /// Для формирования url использовать: '${[domainUrl]}/storage/v1/object/public/${[path]}'
  /// [path] - относительный путь файла,
  /// [domainUrl] - адрес хостинга откуда получаем доступ к supabase.
  Future<String> uploadPhoto(File photo) async {
    return _supabase.storage
        .from(_photosBucketName)
        .upload(_randomPhotoFileName, photo, fileOptions: _fileUploadOptions);
  }
}
