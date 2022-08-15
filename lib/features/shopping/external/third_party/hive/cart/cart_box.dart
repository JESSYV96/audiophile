import 'package:audiophile/features/shopping/domain/entities/cart.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../domain/entities/product.dart';
import '../../../../domain/value_object/item.dart';

class CartBox {
  static Future<void> initCartBox() async {
    _registerAdapter();
    await openBox();
  }

  static void _registerAdapter() {
    Hive.registerAdapter(CartAdapter());
    Hive.registerAdapter(ItemAdapter());
    Hive.registerAdapter(ProductAdapter()); // Not the right place !
  }

  static Future<void> openBox() async {
    await Hive.openBox<Cart>('cart');
  }

  static Future<void> closeBox() async {
    await Hive.close();
  }

  static Box<Cart> getBox() => Hive.box<Cart>('cart');
}
