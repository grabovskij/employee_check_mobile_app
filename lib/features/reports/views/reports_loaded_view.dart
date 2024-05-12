import 'package:flutter/material.dart';
import 'package:mobile_app/configuration/environment.dart';
import 'package:mobile_app/core/utils/date_formatting.dart';
import 'package:mobile_app/domain/report.dart';
import 'package:mobile_app/presentation/widgets/web_image.dart';

class ReportsLoadedView extends StatelessWidget {
  final List<Report> reports;

  const ReportsLoadedView(
    this.reports, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const imageSize = 45.0;

    if (reports.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            'У вас еще нет отчетов о начале/завершении рабочего дня',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];

          return Card(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: WebImage(
                    url: '${Env.supabaseConfig.url}/storage/v1/object/public/${report.photo}',
                    size: imageSize,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Действие: ${report.isEnter ? 'вход' : 'выход'}',
                    ),
                    Text(
                      dateFormatyMMMMEEEEd(report.createdAt),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
