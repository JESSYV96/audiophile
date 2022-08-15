import '../../../../core/interface/crud.dart';
import '../../domain/entities/cart.dart';
import '../../domain/value_object/item.dart';

abstract class ICartdatasource implements Crud2<Cart, Item> {
  @override
  Future<void> add(Item newItem);
  @override
  Future<void> remove(String element);
}
