import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/features/auth/controllers/sign_up_controller.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final SignUpController _signUpController;

  @override
  void initState() {
    super.initState();
    _signUpController = SignUpController(
      context.read(),
      GoRouter.of(context),
    );
  }

  @override
  void dispose() {
    _signUpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
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
                  onChanged: _signUpController.changeEmail,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Пароль'),
                  obscureText: true,
                  onChanged: _signUpController.changePass,
                ),
                RepaintBoundary(
                  child: StreamBuilder(
                    stream: _signUpController.formCompletedStream,
                    builder: (context, formComplete) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: FilledButton(
                          onPressed: formComplete.data ?? false ? _signUpController.signUp : null,
                          child: const Text('Войти'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
