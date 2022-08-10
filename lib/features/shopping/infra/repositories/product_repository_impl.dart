import 'package:audiophile/features/shopping/domain/enums/products_category.dart';

import 'package:audiophile/features/shopping/domain/entities/product.dart';
import 'package:audiophile/features/shopping/infra/interfaces/products_datasources.dart';

import '../../domain/interfaces/product_repository.dart';

class ProductRepository implements IProductRepository {
  final IProductDatasource _datasource;

  ProductRepository(this._datasource);

  @override
  Future<Product> getProductByName(String slug) async {
    return _datasource.getProductByName(slug);
  }
  
  @override
  Future<List<Product>> getProductsByCategory(ProductCategory category) {
    throw UnimplementedError();
  }

}
