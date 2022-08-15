// @TODO: Optional generics parameters are not available in dart
// @HACK: Make two generics classes
abstract class Crud<T> {
  Future<void> add(T element);
  Future<void> remove();
}

abstract class Crud2<T, S> {
  Future<void> add(S element);
  Future<void> remove(String element);
}
