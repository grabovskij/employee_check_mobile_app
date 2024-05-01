import 'dart:developer';

import 'package:go_router/go_router.dart';
import 'package:mobile_app/configuration/navigation/app_routes.dart';
import 'package:mobile_app/core/utils/converters.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignController {
  final BehaviorSubject<String> _emailSubject = BehaviorSubject.seeded('');
  final BehaviorSubject<String> _passSubject = BehaviorSubject.seeded('');

  final SupabaseClient supabase;
  final GoRouter router;

  SignController(this.supabase, this.router);

  void dispose() {
    _emailSubject.close();
    _passSubject.close();
  }

  void changeEmail(String email) => _emailSubject.add(email);

  void changePass(String pass) => _passSubject.add(pass);

  Stream<bool> get formCompletedStream => CombineLatestStream(
        [_emailValidStream, _passValidStream],
        allTrue,
      );

  // Todo (grabowski): Нужно реализовать валидацию
  Stream<bool> get _emailValidStream =>
      _emailSubject.map((email) => email.isNotEmpty);

  // Todo (grabowski): Нужно реализовать валидацию
  Stream<bool> get _passValidStream =>
      _passSubject.map((pass) => pass.isNotEmpty);

  Future<void> sign() async {
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: _emailSubject.value,
        password: _passSubject.value,
      );

      final Session? session = res.session;
      final User? user = res.user;

      router.goNamed(AppRoutes.home.name);
    } on AuthException catch (e, s) {
      log(
        'Error: ${e.message}',
        error: e,
        stackTrace: s,
      );
    }
  }
}
