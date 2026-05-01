import 'package:flutter/material.dart';

class AppInkWell extends StatelessWidget {
  const AppInkWell({
    super.key,
    required this.onTap,
    required this.child,
    this.borderRadius,
    this.color,
  });

  final VoidCallback onTap;
  final Widget child;
  final BorderRadius? borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.transparent,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: child,
      ),
    );
  }
}
