// @TODO: Optional generics parameters are not available in dart
// @HACK: Make two generics classes
abstract class Crud<T> {
  Future<Iterable<T>> getAll();
  Future<void> add(T element);
  Future<void> remove(String element);
}
