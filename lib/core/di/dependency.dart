import 'package:supabase_flutter/supabase_flutter.dart';

enum Flavor {
  mobile,
  web;
}

class Dependency {
  final SupabaseClient supabase;
  final Flavor flavor;

  const Dependency({
    required this.supabase,
    this.flavor = Flavor.mobile,
  });
}
