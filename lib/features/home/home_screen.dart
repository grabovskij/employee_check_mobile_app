import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/configuration/navigation/app_routes.dart';
import 'package:mobile_app/data/data_sources/checking_data_source.dart';
import 'package:mobile_app/features/auth/controllers/login_info.dart';
import 'package:mobile_app/features/home/widgets/menu_card.dart';
import 'package:mobile_app/features/photo_uploading/controllers/photo_uploading_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final UserCheckController userCheckController;

  @override
  void initState() {
    super.initState();
    userCheckController = UserCheckController.create(context);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      const pageHorizontalPadding = 16.0;
      const cardHorizontalPadding = 8.0;
      const cardVerticalPadding = 8.0;

      final cardSize = (constraints.maxWidth - 2 * pageHorizontalPadding - cardHorizontalPadding) / 2;

      return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(pageHorizontalPadding),
          child: Column(
            children: [
              Wrap(
                spacing: cardHorizontalPadding,
                runSpacing: cardVerticalPadding,
                children: [
                  MenuCard(
                    size: cardSize,
                    onTap: () => context.goNamed(AppRoutes.reports.name),
                    child: const Text('Отчеты'),
                  ),
                  MenuCard(
                    size: cardSize,
                    child: Text('1'),
                  ),
                  MenuCard(
                    size: cardSize,
                    child: Text('1'),
                  ),
                  MenuCard(
                    size: cardSize,
                    child: Text('1'),
                  ),
                ],
              ),
              const Text('You have pushed the button this many times:'),
              FilledButton(
                onPressed: () => context.read<LoginInfo>().signOut(),
                child: const Text('Выйти'),
              ),
              FilledButton(
                onPressed: context.read<CheckingDataSource>().getReports,
                child: const Text('Проверить отметки'),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: userCheckController.a,
        ),
      );
    });
  }
}
