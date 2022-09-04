import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shopping/domain/entities/item.dart';
import '../../../shopping/presenter/providers/cart_provider.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/purchaser.dart';
import '../../domain/enums/order_status.dart';
import '../../domain/enums/payement_method.dart';
import '../../domain/value_object/address.dart';

final purchaserProvider = StateProvider.autoDispose((ref) {
  return const Purchaser(name: '', email: '', phoneNumber: '');
});

final addressProvider = StateProvider.autoDispose<Address>((ref) {
  return const Address(street: '', city: '', country: '', zipCode: '');
});

final paymentMethodProvider = StateProvider.autoDispose<PaymentMethods>((ref) {
  return PaymentMethods.creditCart;
});

final orderStatusProvider = StateProvider.autoDispose<OrderStatus>((ref) {
  return OrderStatus.notPaid;
});

final orderProvider = StateProvider.autoDispose<Order>((ref) {
  final Purchaser purchaser = ref.watch(purchaserProvider);
  final Address address = ref.watch(addressProvider);
  final Set<Item> cart = ref.read(cartProvider.notifier).cart;
  final PaymentMethods paymentMethod = ref.watch(paymentMethodProvider);
  final OrderStatus orderStatus = ref.watch(orderStatusProvider);

  return Order(
    purchaser: purchaser,
    address: address,
    paymentMethod: paymentMethod,
    status: orderStatus,
    cart: cart,
  );
});
