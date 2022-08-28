import 'package:audiophile/features/checkout/presenter/screens/checkout_form_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CheckoutModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const CheckoutScreen(),
        ),
      ];
}
