import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/layouts/default_layout.dart';
import '../../domain/entities/product.dart';
import '../providers/get_product_provider.dart';
import '../widgets/banner.dart';
import '../widgets/product_category_item.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Product> spotlightProduct =
        ref.watch(getProductProvider('xx99-mark-2-headphones'));
    return DefaultLayout(
      body: Column(
        children: [
          spotlightProduct.when(
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text(error.toString()),
            data: (product) => BannerHome(spotlightProduct: product),
          ),
          const ProductCategoryItem()
        ],
      ),
    );
  }
}
