import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/item.dart';

class CartPreferences {
  static final _prefs = SharedPreferences.getInstance();
  static const _key = 'cart';

  static Future<Set<Item>> getItems() async {
    final prefs = await _prefs;
    final items = prefs.getStringList(_key);

    if (items == null) {
      return <Item>{};
    }

    return items.map(
      (item) {
        return Item.fromJson(json.decode(item));
      },
    ).toSet();
  }

  static Future<bool> setItems(List<String> items) async {
    final prefs = await _prefs;
    return prefs.setStringList(_key, items);
  }

  static Future<void> deleteItems() async {
    final prefs = await _prefs;
    prefs.remove(_key);
  }
}
