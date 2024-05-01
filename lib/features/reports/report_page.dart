import 'package:flutter/material.dart';
import 'package:mobile_app/features/reports/controllers/reports_controller.dart';
import 'package:mobile_app/features/reports/views/reports_error_view.dart';
import 'package:mobile_app/features/reports/views/reports_loaded_view.dart';
import 'package:mobile_app/features/reports/views/reports_loading_view.dart';
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
      appBar: AppBar(
        title: const Text('Отчеты'),
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: reportsController.stateStream,
          builder: (context, _) {
            final state = reportsController.state;

            return switch (state) {
              ReportsLoadedState() => ReportsLoadedView(state.reports, key: ValueKey(state.reports)),
              ReportsLoadingState() => const ReportsLoadingView(),
              ReportsErrorState() => const ReportsErrorView(),
            };
          },
        ),
      ),
    );
  }
}
