import '../../entities/item.dart';
import '../../entities/product.dart';
import '../../interfaces/cart_repository.dart';

class AddItemUsecase {
  final ICartRepository repository;

  AddItemUsecase({required this.repository});

  Future<void> apply(Product product, int quantity) async {
    final Item newItem = Item(
      name: product.name,
      shortName: product.shortName,
      slug: product.slug,
      price: product.price,
      quantity: quantity,
    );
    await repository.add(newItem);
  }
}
