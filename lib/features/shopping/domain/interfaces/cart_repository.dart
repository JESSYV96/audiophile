import 'package:audiophile/features/shopping/domain/entities/item.dart';

import '../../../../core/interface/crud.dart';

abstract class ICartRepository implements Crud<Item> {
  @override
  Future<Set<Item>> getAll();

  @override
  Future<void> add(Item newItem);

  @override
  Future<void> remove(String element);
}
