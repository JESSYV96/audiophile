import '../../domain/entities/item.dart';
import '../../domain/interfaces/cart_repository.dart';
import '../interfaces/cart_datasource.dart';

class CartRepository implements ICartRepository {
  final ICartdatasource _datasource;

  CartRepository(this._datasource);

  @override
  Future<void> add(Item newItem) async {
    await _datasource.add(newItem);
  }

  
  @override
  Future<void> remove(String element) async{
    await _datasource.remove(element);
  }
  
  @override
  Future<Set<Item>> get() {
    return _datasource.get();
  }
}
