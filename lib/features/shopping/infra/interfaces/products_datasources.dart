import '../../domain/entities/product.dart';

abstract class IProductDatasource {
  Future<List<Product>> getProducts();
  Future<Product> getProductByName(String slug);
}
