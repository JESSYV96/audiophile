import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../value_object/item.dart';

part 'cart.g.dart';

@HiveType(typeId: 1)
class Cart extends Equatable {
  @HiveField(0)
  List<Item> items;

  Cart() : items = const <Item>[];

  double get totalAmount => items.fold<double>(0.0, (previous, item) {
        return previous + item.amount;
      });

  @override
  List<Object?> get props => [items, totalAmount];
}
