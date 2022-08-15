import 'package:audiophile/features/shopping/domain/value_object/item.dart';

import 'package:audiophile/features/shopping/domain/entities/cart.dart';

import '../../infra/interfaces/cart_datasource.dart';
import '../third_party/hive/cart/cart_box.dart';

class CartDatasource implements ICartdatasource {
  @override
  Future<void> add(Item newItem) async {
    final Cart cart = getCart();
    cart.items = [...cart.items, newItem];
    await CartBox.getBox().put('cart', cart);
  }

  @override
  Future<void> remove(String slug) {
    throw UnimplementedError();
  }

  Cart getCart() {
    final Cart? cart = CartBox.getBox().get(
      'cart',
      defaultValue: Cart(),
    );
    if (cart == null) {
      throw Exception('Cart does not exist');
    } else {
      return cart;
    }
  }
}
