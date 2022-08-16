import '../../../../../core/interface/use_case.dart';
import '../../entities/item.dart';
import '../../interfaces/cart_repository.dart';

class GetCartUsecase implements Usecase<Set<Item>, ICartRepository> {
  @override
  final ICartRepository repository;

  GetCartUsecase({required this.repository});

  @override
  Future<Set<Item>> apply() async {
    return repository.get();
  }
}
