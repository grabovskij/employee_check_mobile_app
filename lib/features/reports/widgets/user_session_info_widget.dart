import 'package:flutter/material.dart';
import 'package:mobile_app/configuration/environment.dart';
import 'package:mobile_app/data/repositories/profile_repository.dart';
import 'package:mobile_app/features/reports/controllers/reports_controller.dart';
import 'package:mobile_app/features/reports/extensions/report_build.dart';
import 'package:mobile_app/presentation/widgets/web_image.dart';
import 'package:provider/provider.dart';

class UserSessionInfo extends StatelessWidget {
  const UserSessionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final reportsController = context.read<ReportsController>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: StreamBuilder(
        stream: reportsController.stateStream,
        builder: (context, _) {
          final state = reportsController.state;

          return DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).secondaryHeaderColor,
            ),
            child: switch (state) {
              ReportsLoadedState() => LoadedUserSessionView(state: state),
              ReportsLoadingState() => const LoadingUserSessionView(),
              ReportsErrorState() => ErrorUserSessionView(reportsController: reportsController),
            },
          );
        },
      ),
    );
  }
}

class LoadedUserSessionView extends StatelessWidget {
  const LoadedUserSessionView({
    super.key,
    required this.state,
  });

  final ReportsLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: 70,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: FutureBuilder(
                  future: context.read<ProfileRepository>().profile,
                  builder: (context, snapshot) {
                    return WebImage(
                      url: '${Env.supabaseConfig.url}/storage/v1/object/public/${snapshot.data?.photo ?? ''}',
                    );
                  },
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.isUserSessionActive ? 'Отработанное время' : 'Рабочий день завершен или не начат',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              if (state.isUserSessionActive)
                StreamBuilder(
                  stream: Stream.periodic(const Duration(seconds: 1)).takeWhile((element) => true),
                  builder: (context, _) => Text(format(state.workedTime)),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

class LoadingUserSessionView extends StatelessWidget {
  const LoadingUserSessionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

class ErrorUserSessionView extends StatelessWidget {
  const ErrorUserSessionView({
    super.key,
    required this.reportsController,
  });

  final ReportsController reportsController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Не удалось загрузить отчеты'),
          FilledButton(
            onPressed: reportsController.init,
            child: const Text('Повторить'),
          )
        ],
      ),
    );
  }
}
