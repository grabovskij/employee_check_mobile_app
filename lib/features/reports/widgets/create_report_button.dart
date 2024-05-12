import 'package:flutter/material.dart';
import 'package:mobile_app/features/reports/controllers/reports_controller.dart';
import 'package:mobile_app/features/reports/extensions/report_build.dart';
import 'package:mobile_app/features/reports/mixins/user_report_handling_mixin.dart';

class CreateReportButton extends StatefulWidget {
  final ReportsController reportsController;

  const CreateReportButton({
    required this.reportsController,
    super.key,
  });

  @override
  State<CreateReportButton> createState() => _CreateReportButtonState();
}

class _CreateReportButtonState extends State<CreateReportButton> with UserReportHandling {
  @override
  ReportsController get reportsController => widget.reportsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: StreamBuilder(
        stream: widget.reportsController.stateStream,
        builder: (context, _) {
          final state = widget.reportsController.state;

          if (state is ReportsLoadedState) {
            return FloatingActionButton(
              onPressed: () => createReport(enterStatus: !state.isUserSessionActive),
              child: state.buildCreateReportIcon(),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
