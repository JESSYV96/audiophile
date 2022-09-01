import 'package:equatable/equatable.dart';

import '../../../shopping/domain/entities/item.dart';
import '../enums/order_status.dart';
import '../enums/payement_method.dart';
import '../value_object/address.dart';
import 'purchaser.dart';

class Order extends Equatable {
  final Purchaser purchaser;
  final Address address;
  final PaymentMethods paymentMethod;
  final OrderStatus status;
  final Set<Item> cart;

  const Order({
    required this.purchaser,
    required this.address,
    required this.paymentMethod,
    this.status = OrderStatus.notPaid,
    required this.cart,
  });

  double get cartAmount {
    return cart.fold<double>(0.0, (previous, item) {
      return previous + item.amount;
    });
  }

  double get shippingPrice => cartAmount >= 200 ? 0.0 : 9.99;

  double get vatAmount => cartAmount * (20 / 100);

  double get totalAmount => cartAmount + shippingPrice + vatAmount;

  @override
  List<Object?> get props => [
        purchaser,
        address,
        paymentMethod,
        status,
        cart,
        cartAmount,
        shippingPrice,
        vatAmount,
        totalAmount
      ];
}
