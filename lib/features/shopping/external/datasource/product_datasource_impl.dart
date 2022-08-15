import 'package:audiophile/features/shopping/domain/enums/products_category.dart';
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
  Future<List<Map<String, Object>>> getProductsByCategory(
      ProductCategory category) {
    return Future.delayed(const Duration(milliseconds: 500), () {
      return [
        {
          "id": 1,
          "slug": "xx99-mark-1-headphones",
          "name": "XX99 Mark I Headphones",
          "description":
              "As the gold standard for headphones, the classic XX99 Mark I offers detailed and accurate audio reproduction for audiophiles, mixing engineers, and music aficionados alike in studios and on the go.",
          "category": "headphone",
          "price": 1750,
          "isNewProduct": false
        },
        {
          "id": 2,
          "slug": "xx99-mark-2-headphones",
          "name": "XX99 Mark II Headphones",
          "description":
              "The new XX99 Mark II headphones is the pinnacle of pristine audio. It redefines your premium headphone experience by reproducing the balanced depth and precision of studio-quality sound.",
          "category": "headphone",
          "price": 2999,
          "isNewProduct": true
        }
      ];
    });
  }
}
