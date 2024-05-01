import 'package:flutter/material.dart';
import 'package:mobile_app/features/auth/controllers/login_info.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            FilledButton(
              onPressed: () => context.read<LoginInfo>().signOut(),
              child: const Text('Выйти'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: userCheckController.a,
      ),
    );
  }
}
