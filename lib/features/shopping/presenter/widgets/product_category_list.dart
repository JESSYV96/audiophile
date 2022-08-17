import 'package:audiophile/features/shopping/presenter/widgets/product_category_item.dart';
import 'package:flutter/widgets.dart';

import '../../domain/enums/products_category.dart';

class ProductCategoryList extends StatelessWidget {
  const ProductCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ProductCategory.values
          .map(
            (category) => ProductCategoryItem(category),
          )
          .toList(),
    );
  }
}
