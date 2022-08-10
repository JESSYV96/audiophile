import 'package:flutter/material.dart';

class IconSlot extends StatelessWidget {
  final IconData icon;

  const IconSlot({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      icon: Icon(
        icon,
        color: Theme.of(context).appBarTheme.iconTheme?.color,
      ),
    );
  }
}
