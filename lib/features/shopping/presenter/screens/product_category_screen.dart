import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/widgets/molecules/app_bar.dart';
import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product/product_category_list.dart';
import '../widgets/product/product_item.dart';

class ProductCategoryScreen extends ConsumerWidget {
  final String categoryName;
  const ProductCategoryScreen({Key? key, required this.categoryName}): super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsList =
        ref.watch(getProductFilteredByCategoryProvider(categoryName));
    final cartNotifier = ref.read(cartProvider.notifier);

    return Scaffold(
      appBar: defaultAppBar(context, cartNotifier),
      body: ListView(
        children: [
          _categoryHeader(context),
          productsList.when(
            data: (products) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                    products.map((product) => ProductItem(product)).toList(),
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text(
              error.toString(),
              style: const TextStyle(color: AppColors.black),
            ),
          ),
          const ProductCategoryList()
        ],
      ),
    );
  }

  Widget _categoryHeader(
    BuildContext context,
  ) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      color: AppColors.black,
      child: Text(
        categoryName.toUpperCase(),
        style: Theme.of(context)
            .textTheme
            .headline3!
            .copyWith(color: AppColors.white),
      ),
    );
  }
}
