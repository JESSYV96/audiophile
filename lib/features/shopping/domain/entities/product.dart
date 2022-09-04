import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String slug;
  final String name;
  final String shortName;
  final String category;
  final String description;
  final String photoUrl;
  final double price;
  final bool isNewProduct;

  const Product({
    required this.id,
    required this.slug,
    required this.name,
    required this.shortName,
    required this.category,
    required this.description,
    required this.photoUrl,
    required this.price,
    required this.isNewProduct,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      slug: json["slug"],
      name: json["name"],
      shortName: json["shortName"],
      category: json["category"],
      description: json["description"],
      photoUrl: json["photoUrl"],
      price: json["price"],
      isNewProduct: json["isNewProduct"],
    );
  }

  @override
  List<Object?> get props =>
      [id, slug, name, shortName, category, description, photoUrl, price, isNewProduct];

  @override
  bool get stringify => true;
}
