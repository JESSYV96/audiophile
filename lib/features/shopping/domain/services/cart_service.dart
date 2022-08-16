import '../entities/item.dart';

class CartService {
  static double getTotalAmount(Iterable<Item> items) =>
    items.fold<double>(0.0, (previous, item) {
      return previous + item.amount;
    });

}