import 'package:flutter/material.dart';

import '../../../../features/shopping/presenter/widgets/cart/cart.dart';
import '../atoms/icon.dart';

PreferredSizeWidget defaultAppBar(BuildContext context) {
  return AppBar(
    leading: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: AppIcon(
        icon: Icons.menu,
      ),
    ),
    title: const Text(
      'audiophile',
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: AppIcon(
            icon: Icons.shopping_cart_outlined,
            action: () {
              cartDialog(context);
            }),
      ),
    ],
    toolbarHeight: 70,
  );
}
