import 'package:mobile_app/configuration/environment.dart';
import 'package:mobile_app/core/app_runner.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobile_app/core/di/dependency.dart';

Future<void> main() async {
  final supabase = await Supabase.initialize(
    url: Env.supabaseConfig.url,
    anonKey: Env.supabaseConfig.anonKey,
  );

  final dependency = Dependency(
    supabase: supabase.client,
    flavor: Flavor.web,
  );

  runApplication(dependency);
}
