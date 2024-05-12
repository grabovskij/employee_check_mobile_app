import 'package:flutter/material.dart';
import 'package:mobile_app/domain/report.dart';
import 'package:mobile_app/features/reports/controllers/reports_controller.dart';

extension ReportBuild on ReportsLoadedState {
  List<Report> get inverseSortedReports {
    final copyReports = <Report>[...reports];

    copyReports.sort((a, b) => -a.createdAt.compareTo(b.createdAt));

    return copyReports;
  }

  bool get isUserSessionActive {
    if (reports.isEmpty) {
      return false;
    }

    return inverseSortedReports.first.isEnter;
  }

  Duration get workedTime {
    return DateTime.now().difference(inverseSortedReports.first.createdAt);
  }

  Icon buildCreateReportIcon() {
    const size = 24.0;

    return Icon(
      !isUserSessionActive ? Icons.login_rounded : Icons.logout_rounded,
      size: size,
    );
  }
}
