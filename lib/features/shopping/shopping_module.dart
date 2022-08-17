import 'package:audiophile/features/shopping/presenter/screens/product_category_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/screens/home_screen.dart';
import 'presenter/screens/product_details_screen.dart';

class ShoppingModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const HomeScreen(),
            transition: TransitionType.leftToRightWithFade),
        ChildRoute(
          '/:slug',
          child: (context, args) => ProductDetailScreen(args.data),
        ),
        ChildRoute(
          '/:category/',
          child: (context, args) =>
              ProductCategoryScreen(categoryName: args.params['category']),
        ),
      ];
}
