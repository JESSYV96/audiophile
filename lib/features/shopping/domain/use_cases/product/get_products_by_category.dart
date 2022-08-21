import '../../entities/product.dart';
import '../../interfaces/product_repository.dart';

class GetProductsByCategoryUseCase {
  final String categoryName;
  final IProductRepository repository;

  GetProductsByCategoryUseCase(
      {required this.categoryName, required this.repository});

  Future<List<Product>> invoke() async {
    final List<Product> products = await repository.getAll();

    return products
        .where((product) => product.category == categoryName)
        .toList();
  }
}
