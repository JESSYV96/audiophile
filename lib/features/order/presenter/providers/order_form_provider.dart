import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shopping/domain/entities/item.dart';
import '../../../shopping/presenter/providers/cart_provider.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/purchaser.dart';
import '../../domain/enums/payement_method.dart';
import '../../domain/value_object/address.dart';

final purchaserProvider = StateProvider<Purchaser>((ref) {
  return Purchaser(
      name: 'Bobby', email: 'bobby@email.fr', phoneNumber: '0601020304');
});

final addressProvider = StateProvider<Address>((ref) {
  return Address(street: '', city: '', country: '', zipCode: '');
});

final paymentMethodProvider = StateProvider<PaymentMethods>((ref) {
  return PaymentMethods.creditCart;
});

final orderProvider = StateProvider<Order>((ref) {
  final Purchaser purchaser = ref.watch(purchaserProvider);
  final Address address = ref.watch(addressProvider);
  final Set<Item> cart = ref.read(cartProvider.notifier).cart;
  final PaymentMethods paymentMethod = ref.watch(paymentMethodProvider);
  return Order(
    purchaser: purchaser,
    address: address,
    paymentMethod: paymentMethod,
    cart: cart,
  );
});
