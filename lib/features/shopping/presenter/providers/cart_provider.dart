import 'package:audiophile/features/shopping/domain/use_cases/cart/get_cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/item.dart';
import '../../domain/entities/product.dart';
import '../../domain/use_cases/cart/add_item_to_cart.dart';
import '../../external/datasource/cart/cart_datasource_impl.dart';
import '../../external/datasource/cart/cart_preferences.dart';
import '../../infra/repositories/cart_repository_impl.dart';

class CartNotifier extends StateNotifier<Set<Item>> {
  final Set<Item> cart;

  CartNotifier(this.cart) : super(cart);

  Set<Item> getCartState() => state;

  void addItem(Product product, int quantity) {
    final Item newItem = Item(
      name: product.name,
      shortName: product.shortName,
      slug: product.slug,
      price: product.price,
      quantity: quantity,
      photoUrl: product.photoUrl
    );
    AddItemUsecase(repository: CartRepository(CartDatasource()))
        .invoke(newItem);
    state = {...state, newItem};
  }

  void removeItem(String itemSlug) {
    // ignore: avoid_print
    print('remove');
  }

  void clear() {
    CartPreferences.deleteItems();
    state = <Item>{};
  }
}

final getCartProvider = FutureProvider<Set<Item>>((_) async {
  return GetCartUsecase(
    repository: CartRepository(CartDatasource()),
  ).invoke();
});

final cartProvider = StateNotifierProvider<CartNotifier, Set<Item>>((ref) {
  final cartFetched = ref.watch(getCartProvider);
  return CartNotifier(cartFetched.value ?? <Item>{});
});
