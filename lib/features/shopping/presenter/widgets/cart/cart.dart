import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/entities/cart.dart';
import '../../../external/third_party/hive/cart/cart_box.dart';

Future<void> cartDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return ValueListenableBuilder(
        valueListenable: CartBox.getBox().listenable(),
        builder: (context, Box<Cart> box, _) {
          return AlertDialog(
            title: const Text('AlertDialog Titl'),
            content: SingleChildScrollView(
              child: Text(
                '${box.get('cart')!.totalAmount}',
                style: const TextStyle(color: Colors.black),
              ),
            ),
          );
        },
      );
    },
  );
}
