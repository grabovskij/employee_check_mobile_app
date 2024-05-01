import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/configuration/navigation/app_routes.dart';
import 'package:mobile_app/features/auth/controllers/sign_controller.dart';
import 'package:provider/provider.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  late final SignController _signController;

  @override
  void initState() {
    super.initState();

    _signController = SignController(
      context.read(),
      GoRouter.of(context),
    );
  }

  @override
  void dispose() {
    _signController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход'),
      ),
      body: SafeArea(
        child: InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Email'),
                  onChanged: _signController.changeEmail,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Пароль'),
                  obscureText: true,
                  onChanged: _signController.changePass,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: FilledButton(
                    onPressed: _signController.sign,
                    child: const Text('Войти'),
                  ),
                ),
                FilledButton(
                  onPressed: () => context.goNamed(AppRoutes.signUp.name),
                  child: const Text('Зарегистрироваться'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
