import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final double size;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  final Widget? child;

  const MenuCard({
    required this.size,
    this.padding = const EdgeInsets.all(10),
    this.onTap,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(8),
        ),
        height: size,
        width: size,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
