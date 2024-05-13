import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/configuration/navigation/router_configuration.dart';
import 'package:mobile_app/core/di/dependency.dart';
import 'package:provider/provider.dart';

class AppRouterWidget extends StatefulWidget {
  const AppRouterWidget({
    super.key,
  });

  @override
  State<AppRouterWidget> createState() => _AppRouterWidgetState();
}

class _AppRouterWidgetState extends State<AppRouterWidget> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = AppRouter.create(
      context.read<Dependency>().flavor,
      context.read(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
