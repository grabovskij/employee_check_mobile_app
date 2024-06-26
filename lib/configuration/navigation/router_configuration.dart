import 'package:go_router/go_router.dart';
import 'package:mobile_app/configuration/navigation/app_routes.dart';
import 'package:mobile_app/core/di/dependency.dart';
import 'package:mobile_app/features/auth/controllers/login_info.dart';
import 'package:mobile_app/features/auth/pages/sign_up_page.dart';
import 'package:mobile_app/features/auth/pages/sing_page.dart';
import 'package:mobile_app/features/auth/pages/sing_web_page.dart';
import 'package:mobile_app/features/home/home_page.dart';
import 'package:mobile_app/features/home/home_web_page.dart';
import 'package:mobile_app/features/profile/profile_page.dart';
import 'package:mobile_app/features/reports/report_details_page.dart';
import 'package:mobile_app/features/reports/report_page.dart';

abstract final class AppRouter {
  static GoRouter create(
    Flavor flavor,
    LoginInfo loginInfo,
  ) {
    return GoRouter(
      refreshListenable: loginInfo,
      initialLocation: loginInfo.initialPath,
      redirect: loginInfo.authRouterRedirect,
      routes: [
        GoRoute(
          name: AppRoutes.home.name,
          path: AppRoutes.home.path,
          builder: (context, state) => switch (flavor) {
            Flavor.mobile => const HomePage(),
            Flavor.web => const HomeWebPage(),
          },
          routes: [
            GoRoute(
              name: AppRoutes.reports.name,
              path: AppRoutes.reports.path,
              builder: (context, state) => const ReportPage(),
              routes: [
                GoRoute(
                  name: AppRoutes.reportDetails.name,
                  path: AppRoutes.reportDetails.path,
                  builder: (context, state) => const ReportDetailsPage(),
                ),
              ],
            ),
            GoRoute(
              name: AppRoutes.profile.name,
              path: AppRoutes.profile.path,
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
        GoRoute(
          name: AppRoutes.sign.name,
          path: AppRoutes.sign.path,
          builder: (context, state) => switch (flavor) {
            Flavor.mobile => const SignPage(),
            Flavor.web => const SignWebPage(),
          },
          routes: [
            GoRoute(
              name: AppRoutes.signUp.name,
              path: AppRoutes.signUp.path,
              builder: (context, state) => const SignUpPage(),
            ),
          ],
        )
      ],
    );
  }
}
