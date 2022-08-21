import '../../entities/item.dart';
import '../../interfaces/cart_repository.dart';

class AddItemUsecase {
  final ICartRepository repository;

  AddItemUsecase({required this.repository});

  void invoke(Item newItem) {
    repository.add(newItem);
  }
}
