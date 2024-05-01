import 'package:go_router/go_router.dart';
import 'package:mobile_app/configuration/navigation/app_routes.dart';
import 'package:mobile_app/features/auth/controllers/login_info.dart';
import 'package:mobile_app/features/auth/pages/sign_up_page.dart';
import 'package:mobile_app/features/auth/pages/sing_page.dart';
import 'package:mobile_app/features/home/home_screen.dart';

abstract final class AppRouter {
  static GoRouter create(LoginInfo loginInfo) {
    return GoRouter(
      refreshListenable: loginInfo,
      initialLocation: loginInfo.initialPath,
      redirect: loginInfo.authRouterRedirect,
      routes: [
        GoRoute(
          name: AppRoutes.home.name,
          path: AppRoutes.home.path,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          name: AppRoutes.sign.name,
          path: AppRoutes.sign.path,
          builder: (context, state) => const SignPage(),
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
