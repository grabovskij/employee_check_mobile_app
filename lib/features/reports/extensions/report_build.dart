import 'package:flutter/material.dart';
import 'package:mobile_app/features/reports/controllers/reports_controller.dart';

extension ReportBuild on ReportsLoadedState {
  bool get isLastReportEnter {
    if (reports.isEmpty) {
      return false;
    }

    reports.sort((a, b) => -a.createdAt.compareTo(b.createdAt));

    return reports.first.isEnter;
  }

  Icon buildCreateReportIcon() {
    const size = 24.0;

    return Icon(
      !isLastReportEnter ? Icons.login_rounded : Icons.logout_rounded,
      size: size,
    );
  }
}
