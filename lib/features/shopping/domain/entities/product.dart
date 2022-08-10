import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String slug;
  final String name;
  final String category;
  final String description;
  final double price;
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
