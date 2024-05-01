import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReportsErrorView extends StatelessWidget {
  const ReportsErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text('Что-то пошло не так'),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Вернутся назад'),
          ),
        ],
      ),
    );
  }
}
