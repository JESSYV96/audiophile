import '../../../../core/interface/crud.dart';
import '../../domain/entities/product.dart';

abstract class IProductRepository implements Crud<Product> {

  @override
  Future<List<Product>> getAll();

  Future<Product> getProductByName(String slug);
}
