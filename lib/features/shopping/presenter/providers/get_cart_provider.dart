import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/item.dart';
import '../../domain/use_cases/cart/get_cart.dart';
import '../../external/datasource/cart/cart_datasource_impl.dart';
import '../../infra/repositories/cart_repository_impl.dart';

final getCartProvider = FutureProvider<Set<Item>>((_) async {
  return GetCartUsecase(
    repository: CartRepository(CartDatasource()),
  ).apply();
});
