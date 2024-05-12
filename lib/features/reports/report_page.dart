import 'package:flutter/material.dart';
import 'package:mobile_app/features/reports/controllers/reports_controller.dart';
import 'package:mobile_app/features/reports/views/reports_error_view.dart';
import 'package:mobile_app/features/reports/views/reports_loaded_view.dart';
import 'package:mobile_app/features/reports/views/reports_loading_view.dart';
import 'package:mobile_app/features/reports/widgets/create_report_button.dart';
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
    reportsController = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Отчеты'),
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: reportsController.stateStream,
          builder: (context, _) {
            final state = reportsController.state;

            return switch (state) {
              ReportsLoadedState() => RefreshIndicator(
                  onRefresh: reportsController.init,
                  child: ReportsLoadedView(
                    key: ValueKey(state.reports),
                    state.reports,
                  ),
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
