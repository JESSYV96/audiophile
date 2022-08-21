import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../features/shopping/presenter/providers/cart_provider.dart';
import '../../../../features/shopping/presenter/widgets/cart/cart_dialog.dart';
import '../atoms/icon.dart';

PreferredSizeWidget defaultAppBar(BuildContext context, CartNotifier notifier) {
  return AppBar(
    leading: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: AppIcon(
        icon: Icons.menu,
      ),
    ),
    title: GestureDetector(
      onTap: () => Modular.to.navigate('/products/'),
      child: const Text(
        'audiophile',
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: AppIcon(
            icon: Icons.shopping_cart_outlined,
            action: () {
              cartDialog(context, notifier);
            }),
      ),
    ],
    toolbarHeight: 70,
  );
}
