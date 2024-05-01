abstract final class Env {
  static final supabaseConfig = _SupabaseConfig();
}

class _SupabaseConfig {
  final String url =
      // 'https://192.168.31.134'
      const String.fromEnvironment('SUPABASE_URL');
  final String anonKey = const String.fromEnvironment('SUPABASE_ANON_KEY');
}
