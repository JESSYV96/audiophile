import '../../../../core/interface/crud.dart';
import '../../domain/entities/item.dart';

abstract class ICartdatasource implements Crud<Item> {
  @override
  Future<Set<Item>> getAll();
  @override
  Future<void> add(Item newItem);
  @override
  Future<void> remove(String element);
}
