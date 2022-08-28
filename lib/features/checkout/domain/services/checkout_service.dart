import '../../../shopping/domain/entities/item.dart';

class CheckoutService {
  static double getShippingPrice() {
    return 9.99;
  }

  static double getTotalAmount(Iterable<Item> items) {
    return items.fold<double>(0.0, (previous, item) {
      return previous + item.amount;
    });
  }

  static double getVATAmount({required double amount, double rate = 20}) {
    return amount * (rate / 100);
  }

  static double getTotalPrice({
    required double totalItemAmount,
    required double shippingPrice,
    required double vat,
  }) {
    return totalItemAmount + shippingPrice + vat;
  }
}
