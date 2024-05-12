import 'package:flutter/material.dart';
import 'package:mobile_app/core/utils/geolocator.dart';
import 'package:mobile_app/features/photo_uploading/controllers/photo_uploading_controller.dart';
import 'package:mobile_app/features/reports/controllers/reports_controller.dart';
import 'package:mobile_app/features/reports/extensions/report_build.dart';
import 'package:mobile_app/features/reports/views/reports_error_view.dart';
import 'package:mobile_app/features/reports/views/reports_loaded_view.dart';
import 'package:mobile_app/features/reports/views/reports_loading_view.dart';
import 'package:mobile_app/presentation/factories/snackbar_factories.dart';
import 'package:provider/provider.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  late final ReportsController reportsController;

  @override
  void initState() {
    super.initState();
    reportsController = ReportsController(context.read())..init();
  }

  @override
  void dispose() {
    reportsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Отчеты')),
      body: SafeArea(
        child: StreamBuilder(
          stream: reportsController.stateStream,
          builder: (context, _) {
            final state = reportsController.state;

            return switch (state) {
              ReportsLoadedState() => RefreshIndicator(
                  onRefresh: reportsController.init,
                  child: ReportsLoadedView(state.reports, key: ValueKey(state.reports)),
                ),
              ReportsLoadingState() => const ReportsLoadingView(),
              ReportsErrorState() => const ReportsErrorView(),
            };
          },
        ),
      ),
      floatingActionButton: CreateReportButton(reportsController: reportsController),
    );
  }
}

class CreateReportButton extends StatefulWidget {
  final ReportsController reportsController;

  const CreateReportButton({
    required this.reportsController,
    super.key,
  });

  @override
  State<CreateReportButton> createState() => _CreateReportButtonState();
}

class _CreateReportButtonState extends State<CreateReportButton> {
  late final UserCheckController userCheckController;

  @override
  void initState() {
    super.initState();
    userCheckController = UserCheckController.create(context);
  }

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
              onPressed: () => createReport(enterStatus: !state.isLastReportEnter),
              child: state.buildCreateReportIcon(),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Future<void> createReport({
    required bool enterStatus,
  }) async {
    try {
      await userCheckController.createReport(enterStatus: enterStatus);

      SnackBarFactory.showSnackBar(context, content: const Text('Отчет сформирован'));
    } catch (e) {
      SnackBarFactory.showSnackBar(context, content: const Text('Не удалось сформировать отчет'));
    }

    await widget.reportsController.init();
  }
}
