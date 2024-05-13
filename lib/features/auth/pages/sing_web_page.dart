import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/configuration/navigation/app_routes.dart';
import 'package:mobile_app/features/auth/mixins/sign_controller_state_mixin.dart';
import 'package:mobile_app/features/auth/widgets/login_overlay.dart';

class SignWebPage extends StatefulWidget {
  const SignWebPage({super.key});

  @override
  State<SignWebPage> createState() => _SignWebPageState();
}

class _SignWebPageState extends State<SignWebPage>
    with SignControllerStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    onChanged: signController.changeEmail,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Пароль'),
                    obscureText: true,
                    onChanged: signController.changePass,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: FilledButton(
                      onPressed: signController.sign,
                      child: const Text('Войти'),
                    ),
                  ),
                  FilledButton(
                    onPressed: () => context.goNamed(AppRoutes.signUp.name),
                    child: const Text('Зарегистрироваться'),
                  ),
                ],
              ),
              LoginOverlay(signController: signController),
            ],
          ),
        ),
      ),
    );
  }
}
