import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/product.dart';
import '../../domain/use_cases/product/get_product.dart';
import '../../external/datasource/product_datasource_impl.dart';
import '../../infra/repositories/product_repository_impl.dart';

final getProductProvider =
    FutureProvider.family<Product, String>((_, slug) async {
  return GetProductUseCase(
    slug: slug,
    repository: ProductRepository(ProductDatasource()),
  ).invoke();
});
