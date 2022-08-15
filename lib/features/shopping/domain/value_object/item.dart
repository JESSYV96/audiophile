import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../entities/product.dart';

part 'item.g.dart';

@HiveType(typeId: 2)
class Item extends Equatable {
  @HiveField(0)
  final Product product;
  @HiveField(1)
  final int quantity;

  @override
  List<Object?> get props => [product, quantity];

  const Item({required this.product, required this.quantity});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(product: json["product"], quantity: json['quantity']);
  }

  double get amount => quantity * product.price;
}
