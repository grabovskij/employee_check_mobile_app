import 'package:flutter/material.dart';
import 'package:mobile_app/features/auth/controllers/sign_controller.dart';

class LoginOverlay extends StatelessWidget {
  const LoginOverlay({
    super.key,
    required this.signController,
  });

  final SignController signController;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: StreamBuilder(
        stream: signController.stateStream,
        builder: (context, _) {
          return switch (signController.state) {
            SignLoadingState() => ColoredBox(
                color: Colors.white.withOpacity(0.35),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
