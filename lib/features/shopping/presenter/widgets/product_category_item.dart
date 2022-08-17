import 'package:audiophile/core/design_system/widgets/atoms/icon.dart';
import 'package:audiophile/features/shopping/domain/enums/products_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/design_system/colors.dart';

class ProductCategoryItem extends StatelessWidget {
  final ProductCategory category;

  const ProductCategoryItem(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 25),
      decoration: const BoxDecoration(
        color: AppColors.lightgray,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(category.name.toUpperCase(),
              style: Theme.of(context).textTheme.headline5),
          TextButton(
            onPressed: () {
              Modular.to.navigate('/products/${category.name}/');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    'Shop'.toUpperCase(),
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: AppColors.black.withOpacity(0.5),
                        ),
                  ),
                ),
                const AppIcon(
                  icon: Icons.arrow_forward_ios,
                  color: AppColors.secondary,
                  size: 14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
