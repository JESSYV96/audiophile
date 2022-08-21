// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../core/theme/widgets/molecules/app_bar.dart';
// import '../../features/shopping/domain/use_cases/cart/get_cart.dart';
// import '../../features/shopping/external/datasource/cart/cart_datasource_impl.dart';
// import '../../features/shopping/infra/repositories/cart_repository_impl.dart';
// import '../../features/shopping/presenter/providers/cart_provider.dart';

// class DefaultLayout extends HookWidget {
//   final Widget body;

//   const DefaultLayout({Key? key, required this.body}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // final cartfetched = ref.watch(getCartProvider).value;
//     // final cart = ref.watch(cartProvider);
//     // final cartNotifier = ref.read(cartProvider.notifier);
//     // cartNotifier.cartInit(cartfetched);
   

//     return Scaffold(
//       appBar: defaultAppBar(context, cart, cartNotifier),
//       body: ListView(children: [body]),
//     );
//   }
// }
