import 'dart:convert';

import '../../../domain/entities/item.dart';
import '../../../infra/interfaces/cart_datasource.dart';
import 'cart_preferences.dart';

class CartDatasource implements ICartdatasource {
  @override
  Future<void> add(Item newItem) async {
    final currentCart = await get();
    currentCart.add(newItem);
    final List<String> newCart = currentCart.map((item) {
      return json.encode(Item.toJson(item));
    }).toList();
    CartPreferences.setItems(newCart);
  }

  @override
  Future<void> remove(String slug) {
    throw UnimplementedError();
  }

  @override
  Future<Set<Item>> get() async {
    return CartPreferences.getItems();
  }
}
