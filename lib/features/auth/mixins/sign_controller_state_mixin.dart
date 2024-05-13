import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/features/auth/controllers/sign_controller.dart';
import 'package:mobile_app/presentation/factories/snackbar_factories.dart';
import 'package:provider/provider.dart';

mixin SignControllerStateMixin<T extends StatefulWidget> on State<T> {
  late final SignController signController;

  StreamSubscription<SignState>? _streamSubscription;

  @override
  void initState() {
    super.initState();

    signController = SignController(
      context.read(),
      GoRouter.of(context),
    );

    _streamSubscription = signController.stateStream.listen(_onChangeState);
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    signController.dispose();
    super.dispose();
  }

  void _onChangeState(SignState state) {
    if (state is SignErrorState) {
      SnackBarFactory.showSnackBar(
        context,
        content: Text(state.message),
        position: Position.bottom,
      );
    }
  }
}
