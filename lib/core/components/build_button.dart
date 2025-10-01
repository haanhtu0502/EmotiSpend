import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  const BuildButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.padding,
    this.radius,
    required this.content,
    this.border,
  });

  final void Function() onPressed;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final Widget content;
  final BorderSide? border;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(radius ?? 8),
          side: border ?? BorderSide.none,
        ),
      ),
      child: content,
    );
  }
}
