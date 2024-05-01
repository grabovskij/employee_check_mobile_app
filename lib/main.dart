import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/configuration/environment.dart';
import 'package:mobile_app/core/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobile_app/core/di/dependency.dart';

Future<void> main() async {
  final supabase = await Supabase.initialize(
    url: Env.supabaseConfig.url,
    anonKey: Env.supabaseConfig.anonKey,
    realtimeClientOptions: const RealtimeClientOptions(
      logLevel: RealtimeLogLevel.debug,
    ),
  );

  Intl.defaultLocale = 'ru_RU';
  initializeDateFormatting(Intl.defaultLocale);

  final dependency = Dependency(supabase: supabase.client);

  runApp(MyApp(dependency));
}
