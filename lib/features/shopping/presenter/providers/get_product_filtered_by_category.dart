import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/product.dart';
import '../../domain/use_cases/product/get_products_by_category.dart';
import '../../external/datasource/product_datasource_impl.dart';
import '../../infra/repositories/product_repository_impl.dart';

final getProductFilteredByCategoryProvider =
    FutureProvider.family<List<Product>, String>((_, category) async {
  return GetProductsByCategoryUseCase(
    categoryName: category,
    repository: ProductRepository(ProductDatasource()),
  ).invoke();
});
