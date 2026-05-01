import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final BorderRadius? radius;
  final List<BoxShadow>? boxShadow;
  final Border? border;
  final Gradient? gradient;
  final AlignmentGeometry? alignment;
  final BoxShape? shape;

  const AppContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.color,
    this.radius,
    this.boxShadow,
    this.border,
    this.gradient,
    this.alignment,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? .zero,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        shape: shape ?? .rectangle,
        color: gradient == null ? (color ?? Colors.white) : null,
        gradient: gradient,
        borderRadius: radius,
        boxShadow:
            boxShadow ??
            [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
        border: border,
      ),
      child: child,
    );
  }
}
