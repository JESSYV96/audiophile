import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/enums/payement_method.dart';

final nameProvider = StateProvider<String>((ref) {
  return '';
});

final paymentMethodProvider = StateProvider<PaymentMethods>((ref) {
  return PaymentMethods.creditCart;
});
