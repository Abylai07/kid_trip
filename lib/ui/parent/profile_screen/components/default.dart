import 'package:flutter/material.dart';

class DefaultContainer extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double? padding;
  const DefaultContainer({
    Key? key,
    this.child,
    this.color,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 0),
      width: padding == 8
          ? 48
          : padding == null
          ? 32
          : 42,
      height: padding == 8
          ? 48
          : padding == null
          ? 32
          : 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color!,
      ),
      child: child!,
    );
  }
}
