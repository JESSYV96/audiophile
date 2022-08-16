import 'package:audiophile/core/design_system/colors.dart';
import 'package:audiophile/core/design_system/widgets/atoms/buttons/filled_button.dart';
import 'package:audiophile/features/shopping/external/datasource/cart/cart_datasource_impl.dart';
import 'package:audiophile/features/shopping/infra/repositories/cart_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/layouts/default_layout.dart';
import '../../domain/entities/product.dart';
import '../../domain/use_cases/cart/add_item_to_cart.dart';
import '../widgets/quantity_counter.dart';

final quantityProvider = StateProvider.autoDispose((ref) => 1);

class ProductDetailScreen extends ConsumerWidget {
  final Product product;

  const ProductDetailScreen(this.product, {Key? key}) : super(key: key);

  void _addNewItem(Product product, int quantity) {
    AddItemUsecase(repository: CartRepository(CartDatasource()))
        .apply(product, quantity);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = ref.watch(quantityProvider);

    return DefaultLayout(
      body: Container(
        margin: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                'New Product'.toUpperCase(),
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
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                product.description,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: AppColors.black.withOpacity(0.5),
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "2999.29 €",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                QuantityCounter(
                  quantity: quantity,
                  reduceQuantity: () {
                    if (quantity > 0) {
                      ref.read(quantityProvider.notifier).state--;
                    }
                  },
                  raiseQuantity: () {
                    ref.read(quantityProvider.notifier).state++;
                  },
                ),
                AppFilledButton(
                  text: AppLocalizations.of(context)!.addToCart,
                  action: () {
                    _addNewItem(product, quantity);
                    Modular.to.navigate('/products/');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
