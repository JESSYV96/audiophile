import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String slug;
  final String name;
  final String shortName;
  final String photoUrl;
  final double price;
  final int quantity;

  const Item({
    required this.slug,
    required this.name,
    required this.shortName,
    required this.price,
    required this.photoUrl,
    required this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      slug: json["slug"],
      name: json["name"],
      shortName: json["shortName"],
      photoUrl: json["photoUrl"],
      price: json["price"],
      quantity: json['quantity'],
    );
  }

  static Map<String, dynamic> toJson(Item item) {
    return {
      "name": item.name,
      "slug": item.slug,
      "shortName": item.shortName,
      "photoUrl": item.photoUrl,
      "price": item.price,
      "quantity": item.quantity
    };
  }

  @override
  List<Object?> get props => [name, slug, shortName, photoUrl, price, quantity];

  double get amount => quantity * price;
}
