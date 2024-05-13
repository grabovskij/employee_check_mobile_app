import 'package:flutter/material.dart';

class MenuWebTile extends StatelessWidget {
  final EdgeInsets padding;
  final VoidCallback? onTap;
  final Widget? child;

  const MenuWebTile({
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
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
