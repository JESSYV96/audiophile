import 'package:audiophile/features/shopping/domain/entities/product.dart';

import '../../../../core/utils/read_json.dart';
import '../../infra/interfaces/products_datasources.dart';

class ProductDatasource implements IProductDatasource {
  @override
  Future<Product> getProductByName(String slug) async {
    final json = await readJson('assets/data/products_catalog.json');
    final List<dynamic> products = json['products'];
    final product = products.firstWhere((product) => product['slug'] == slug);

    return Product.fromJson(product);
  }

  @override
  Future<List<Product>> getProducts() async {
    final json = await readJson('assets/data/products_catalog.json');
    final List<dynamic> productsJson = json['products'];

    final List<Product> products = productsJson
        .map(
          (product) => Product.fromJson(product),
        )
        .toList();

    return products;
  }
}
