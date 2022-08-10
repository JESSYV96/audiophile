import 'package:flutter/material.dart';

import '../atoms/icon.dart';

PreferredSizeWidget defaultAppBar() {
  return AppBar(
    leading: const IconSlot(icon: Icons.menu),
    title: const Text(
      'audiophile',
    ),
    actions: const [
      IconSlot(icon: Icons.shopping_cart_outlined),
    ],
    toolbarHeight: 70,
  );
}
