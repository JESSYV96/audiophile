import '../../../shopping/domain/entities/item.dart';
import '../enums/payement_method.dart';
import '../value_object/address.dart';
import 'purchaser.dart';

class Checkout {
  final Purchaser purchaser;
  final Address address;
  final PaymentMethods paymentMethod;
  final Set<Item> cart;

  Checkout({
    required this.purchaser,
    required this.address,
    required this.paymentMethod,
    required this.cart,
  });
}
