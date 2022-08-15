import 'package:audiophile/features/shopping/domain/entities/cart.dart';

import '../../../../core/interface/crud.dart';
import '../value_object/item.dart';

abstract class ICartRepository implements Crud2<Cart, Item> {
  @override
  Future<void> add(Item newItem);

  @override
  Future<void> remove(String element);
}
