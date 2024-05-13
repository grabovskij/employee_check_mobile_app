abstract final class Env {
  static final supabaseConfig = _SupabaseConfig();
}

class _SupabaseConfig {
  final String url = const String.fromEnvironment(
    'SUPABASE_URL',
    // FIXME (grabowski): Убрать из сборки и добавить в переменные окружения
    defaultValue: 'http://192.168.31.97:8000',
  );
  final String anonKey = const String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    // FIXME (grabowski): Убрать из сборки и добавить в переменные окружения
    defaultValue:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE0NDI0NDAwLAogICJleHAiOiAxODcyMTkwODAwCn0.P7zp7babtPYRV5MYlGfctIHQmwLDBtbW3fju3_tL9AA',
  );
}
