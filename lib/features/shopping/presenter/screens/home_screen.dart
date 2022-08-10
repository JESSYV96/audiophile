import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/widgets/molecules/app_bar.dart';
import '../../domain/entities/product.dart';
import '../../domain/use_cases/get_product.dart';
import '../../external/datasource/product_datasource_impl.dart';
import '../../infra/repositories/product_repository_impl.dart';
import '../widgets/banner.dart';
import '../widgets/product_category_item.dart';

final spotlightProductProvider = FutureProvider((_) async {
  return GetProductUseCase(
    slug: 'xx99-mark-2-headphones',
    repository: ProductRepository(ProductDatasource()),
  ).apply();
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Product> spotlightProduct =
        ref.watch(spotlightProductProvider);
    return Scaffold(
      appBar: defaultAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            spotlightProduct.when(
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) =>
                  const Text('Oops, something unexpected happened'),
              data: (product) => BannerHome(spotlightProduct: product),
            )
          ],
        ),
      ),
    );
  }
}
