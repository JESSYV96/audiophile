import 'package:audiophile/features/shopping/domain/value_object/item.dart';

import '../../entities/product.dart';
import '../../interfaces/cart_repository.dart';

class AddItemUsecase {
  final ICartRepository repository;

  AddItemUsecase({required this.repository});

  Future<void> apply(Product product, int quantity) async {
    final Item newItem = Item(product: product, quantity: quantity);
    await repository.add(newItem);
  }
}
