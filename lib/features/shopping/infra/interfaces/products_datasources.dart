import '../../domain/entities/product.dart';
import '../../domain/enums/products_category.dart';

abstract class IProductDatasource {
  Future<List<Map<String, dynamic>>> getProductsByCategory(
      ProductCategory category);
  Future<Product> getProductByName(String slug);
}
