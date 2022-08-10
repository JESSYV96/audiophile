import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/screens/home_screen.dart';
import 'presenter/screens/product_detail_screen.dart';

class ShoppingModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomeScreen(),
        ),
        ChildRoute(
          '/:slug',
          child: (context, args) => ProductDetailScreen(args.data),
        ),
      ];
}
