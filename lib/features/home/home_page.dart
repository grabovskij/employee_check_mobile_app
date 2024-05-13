import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/configuration/navigation/app_routes.dart';
import 'package:mobile_app/features/auth/controllers/login_info.dart';
import 'package:mobile_app/features/home/widgets/menu_card.dart';
import 'package:mobile_app/features/photo_uploading/controllers/photo_uploading_controller.dart';
import 'package:mobile_app/features/reports/widgets/user_session_info_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageHorizontalPadding = 16.0;
  final cardHorizontalPadding = 8.0;
  final cardVerticalPadding = 8.0;

  late final UserReportController userCheckController;

  @override
  void initState() {
    super.initState();
    userCheckController = UserReportController.create(context);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardSize = (constraints.maxWidth -
                2 * pageHorizontalPadding -
                cardHorizontalPadding) /
            2;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: GestureDetector(
                  onTap: () => context.read<LoginInfo>().signOut(),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.logout),
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(pageHorizontalPadding),
            child: Column(
              children: [
                const UserSessionInfo(),
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
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
                        onTap: () => context.goNamed(AppRoutes.profile.name),
                        child: const Text('Профиль'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
