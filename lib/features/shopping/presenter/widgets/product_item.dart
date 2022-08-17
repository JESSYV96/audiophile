import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/design_system/colors.dart';
import '../../../../core/design_system/widgets/atoms/buttons/filled_button.dart';
import '../../domain/entities/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          if (product.isNewProduct)
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                'New Product'.toUpperCase(),
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .overline
                    ?.copyWith(color: AppColors.secondary, fontSize: 12),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              product.name.toUpperCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              product.description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: AppColors.black.withOpacity(0.5),
                  ),
            ),
          ),
          AppFilledButton(
              text: AppLocalizations.of(context)!.seeProduct.toUpperCase(),
              action: () {
                Modular.to
                    .pushNamed('/products/${product.slug}', arguments: product);
              }),
        ],
      ),
    );
  }
}
