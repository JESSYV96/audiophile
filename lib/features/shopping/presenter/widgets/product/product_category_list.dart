import 'package:flutter/widgets.dart';

import '../../../domain/enums/products_category.dart';
import 'product_category_item.dart';

class ProductCategoryList extends StatelessWidget {
  const ProductCategoryList({Key? key}): super(key: key);

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
