import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_app/features/photo_uploading/controllers/photo_uploading_controller.dart';
import 'package:mobile_app/features/reports/controllers/reports_controller.dart';
import 'package:mobile_app/presentation/factories/snackbar_factories.dart';

mixin UserReportHandling<T extends StatefulWidget> on State<T> {
  late final UserReportController _userReportController;

  StreamSubscription<CheckingState>? _streamSubscription;

  ReportsController get reportsController;

  @override
  void initState() {
    super.initState();
    _userReportController = UserReportController.create(context);
    _streamSubscription = _userReportController.stateStream.listen(_onChangeState);
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _userReportController.dispose();
    super.dispose();
  }

  Future<void> createReport({required bool enterStatus}) =>
      _userReportController.createReport(enterStatus: enterStatus);

  Future<void> _onChangeState(CheckingState event) async {
    if (event is CheckingSuccessState) {
      SnackBarFactory.showSnackBar(context, content: const Text('Отчет сформирован'));

      await Future.delayed(const Duration(milliseconds: 150));

      reportsController.init();
    }

    if (event is CheckingErrorState) {
      SnackBarFactory.showSnackBar(context, content: Text(event.message));
    }
  }
}
