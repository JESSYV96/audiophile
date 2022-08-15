import '../../../../../core/interface/use_case.dart';
import '../../entities/product.dart';
import '../../interfaces/product_repository.dart';

class GetProductUseCase implements Usecase<Product, IProductRepository> {
  final String slug;

  @override
  final IProductRepository repository;

  GetProductUseCase({required this.slug, required this.repository});

  @override
  Future<Product> apply() async {
    return repository.getProductByName(slug);
  }
}
