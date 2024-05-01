import 'package:flutter/material.dart';

class ReportsLoadingView extends StatelessWidget {
  const ReportsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: RepaintBoundary(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
