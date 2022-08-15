import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'product.g.dart';

@HiveType(typeId: 3)
class Product extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String slug;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final double price;
  @HiveField(6)
  final bool isNewProduct;

  const Product({
    required this.id,
    required this.slug,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.isNewProduct,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      slug: json["slug"],
      name: json["name"],
      category: json["category"],
      description: json["description"],
      price: json["price"],
      isNewProduct: json["isNewProduct"],
    );
  }

  @override
  List<Object?> get props =>
      [id, slug, name, category, description, price, isNewProduct];

  @override
  bool get stringify => true;
}
