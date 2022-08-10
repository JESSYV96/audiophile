import '../entities/product.dart';
import '../enums/products_category.dart';
import '../interfaces/product_repository.dart';

class GetProductsByCategoryUseCase {
  final ProductCategory category;
  final IProductRepository repository;

  GetProductsByCategoryUseCase({required this.category, required this.repository});

   Future<List<Product>> apply() async {
    return repository.getProductsByCategory(category);
  }
}
