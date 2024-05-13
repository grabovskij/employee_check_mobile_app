import 'dart:developer';

import 'package:go_router/go_router.dart';
import 'package:mobile_app/configuration/navigation/app_routes.dart';
import 'package:mobile_app/core/utils/converters.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

sealed class SignState {}

class SignInitialState extends SignState {}

class SignLoadingState extends SignState {}

class SignSuccessState extends SignState {}

class SignErrorState extends SignState {
  final String message;

  SignErrorState(this.message);
}

class SignController {
  final _stateSubject = BehaviorSubject<SignState>.seeded(SignInitialState());
  final _emailSubject = BehaviorSubject<String>.seeded('');
  final _passSubject = BehaviorSubject<String>.seeded('');

  final SupabaseClient supabase;
  final GoRouter router;

  SignController(this.supabase, this.router);

  SignState get state => _stateSubject.value;

  Stream<SignState> get stateStream => _stateSubject;

  void dispose() {
    _stateSubject.close();
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
    _stateSubject.add(SignLoadingState());

    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: _emailSubject.value,
        password: _passSubject.value,
      );

      _stateSubject.add(SignInitialState());
      router.goNamed(AppRoutes.home.name);
    } on AuthException catch (e, s) {
      _stateSubject.add(SignErrorState('Error: ${e.message}'));
      _stateSubject.add(SignInitialState());
    }
  }
}
