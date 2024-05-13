import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/configuration/navigation/app_routes.dart';
import 'package:mobile_app/features/auth/controllers/login_info.dart';
import 'package:mobile_app/features/home/widgets/menu_web_tile.dart';
import 'package:mobile_app/features/photo_uploading/controllers/photo_uploading_controller.dart';
import 'package:mobile_app/features/reports/widgets/user_session_info_widget.dart';
import 'package:provider/provider.dart';

class HomeWebPage extends StatefulWidget {
  const HomeWebPage({super.key});

  @override
  State<HomeWebPage> createState() => _HomeWebPageState();
}

class _HomeWebPageState extends State<HomeWebPage> {
  final pageHorizontalPadding = 16.0;

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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 1,
                  child: UserSessionInfo(),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      MenuWebTile(
                        onTap: () => context.goNamed(AppRoutes.reports.name),
                        child: const Text('Отчеты'),
                      ),
                      const SizedBox(height: 10),
                      MenuWebTile(
                        onTap: () => context.goNamed(AppRoutes.profile.name),
                        child: const Text('Профиль'),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        );
      },
    );
  }
}
