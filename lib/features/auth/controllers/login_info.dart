import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/configuration/navigation/app_routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginInfo with ChangeNotifier {
  final SupabaseClient supabase;

  LoginInfo(this.supabase) {
    supabase.auth.onAuthStateChange.listen(_onAuthStateChange);
  }

  String get initialPath => isLogin ? AppRoutes.home.path : AppRoutes.sign.path;

  bool get isLogin => supabase.auth.currentSession?.accessToken != null;

  Future<void> signOut({
    bool allDevices = false,
  }) async {
    await supabase.auth.signOut(
      scope: allDevices ? SignOutScope.global : SignOutScope.local,
    );
  }

  Future<String?> authRouterRedirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    if (state.uri.path == '${AppRoutes.sign.path}/${AppRoutes.signUp.path}') {
      return null;
    }

    if (!isLogin) {
      return AppRoutes.sign.path;
    }

    return null;
  }

  void _onAuthStateChange(AuthState authState) {
    notifyListeners();
  }
}
