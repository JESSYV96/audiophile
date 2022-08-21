abstract class Usecase<T, I> {
  final I repository;

  Usecase(this.repository);

  Future<T> invoke();
}
