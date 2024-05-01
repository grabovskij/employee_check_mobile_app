import 'package:flutter/widgets.dart';
import 'package:mobile_app/configuration/navigation/router_widget.dart';
import 'package:mobile_app/core/di/data_sources_provider.dart';
import 'package:mobile_app/core/di/dependency.dart';
import 'package:mobile_app/features/auth/controllers/login_info.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  final Dependency dependency;

  const MyApp(
    this.dependency, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: dependency),
        Provider.value(value: dependency.supabase),
        ListenableProvider.value(value: LoginInfo(dependency.supabase)),
      ],
      child: const DataSourcesProvider(
        child: AppRouterWidget(),
      ),
    );
  }
}
