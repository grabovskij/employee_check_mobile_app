import 'package:flutter/material.dart';

enum Position {
  top,
  bottom;
}

class SnackBarFactory {
  static void showSnackBar(
    BuildContext context, {
    required Widget content,
    Position position = Position.top,
    Duration duration = const Duration(seconds: 3),
    double topOffset = 200,
    bool showCloseIcon = false,
    double horizontalPadding = 16,
    SnackBarAction? action,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: content,
      duration: duration,
      showCloseIcon: showCloseIcon,
      dismissDirection: DismissDirection.up,
      action: action,
      margin: EdgeInsets.only(
        left: horizontalPadding,
        right: horizontalPadding,
        bottom: switch (position) {
          Position.top => MediaQuery.sizeOf(context).height - topOffset,
          Position.bottom => 32,
        },
      ),
    );

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(snackBar);
  }
}
