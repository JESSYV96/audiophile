import 'package:audiophile/features/shopping/domain/entities/item.dart';

import '../../../../core/interface/crud.dart';

abstract class ICartRepository implements Crud<Item> {
  Future<Set<Item>> get();

  @override
  Future<void> add(Item newItem);

  @override
  Future<void> remove(String element);
}
