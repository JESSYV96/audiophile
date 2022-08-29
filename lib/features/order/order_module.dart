import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/screens/checkout_form_screen.dart';

class OrderModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const OrderScreen(),
        ),
      ];
}
