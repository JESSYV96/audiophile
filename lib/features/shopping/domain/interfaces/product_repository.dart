import '../../domain/entities/product.dart';
import '../../domain/enums/products_category.dart';

abstract class IProductRepository {
  Future<List<Product>> getProductsByCategory(ProductCategory category);
  Future<Product> getProductByName(String slug);
}
