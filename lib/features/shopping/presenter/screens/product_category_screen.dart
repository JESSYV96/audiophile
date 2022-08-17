import 'package:audiophile/features/shopping/presenter/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/colors.dart';
import '../../../../core/layouts/default_layout.dart';
import '../providers/get_product_filtered_by_category.dart';
import '../widgets/product_category_list.dart';

class ProductCategoryScreen extends ConsumerWidget {
  final String categoryName;
  const ProductCategoryScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsList =
        ref.watch(getProductFilteredByCategoryProvider(categoryName));
    return DefaultLayout(
      body: Column(  
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
