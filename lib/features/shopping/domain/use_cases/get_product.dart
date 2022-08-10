import '../entities/product.dart';
import '../interfaces/product_repository.dart';

class GetProductUseCase {
  final String slug;
  final IProductRepository repository;

  GetProductUseCase({required this.slug, required this.repository});

  Future<Product> apply() async {
    return repository.getProductByName(slug);
  }
}
