import 'package:flutter_modular/flutter_modular.dart';

import 'features/order/order_module.dart';
import 'features/shopping/shopping_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/products/', module: ShoppingModule()),
    ModuleRoute('/order/', module: OrderModule()),
  ];
}
