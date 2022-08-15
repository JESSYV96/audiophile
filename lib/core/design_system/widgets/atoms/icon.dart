import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;
  final EdgeInsets? padding;
  final Function()? action;

  const AppIcon(
      {Key? key,
      required this.icon,
      this.color,
      this.padding,
      this.size,
      this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action ?? () {},
      child: Icon(
        icon,
        size: size,
        color: color ?? Theme.of(context).appBarTheme.iconTheme?.color,
      ),
    );
  }
}
