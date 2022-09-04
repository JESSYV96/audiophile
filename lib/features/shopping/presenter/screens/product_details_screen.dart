import 'package:audiophile/core/theme/colors.dart';
import 'package:audiophile/core/theme/widgets/atoms/buttons/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/theme/widgets/molecules/app_bar.dart';
import '../../../../core/utils/amount_format.dart';
import '../../domain/entities/product.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart/quantity_counter.dart';
import '../widgets/product/product_photo_slot.dart';

final quantityProvider = StateProvider.autoDispose((ref) => 1);

class ProductDetailScreen extends ConsumerWidget {
  final Product product;

  const ProductDetailScreen(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = ref.watch(quantityProvider);
    final cartNotifier = ref.read(cartProvider.notifier);

    return Scaffold(
      appBar: defaultAppBar(context, cartNotifier),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: ListView(
          children: [
            PhotoSlot(product.photoUrl),
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
                amountFormat.format(product.price),
                style: Theme.of(context).textTheme.headline5,
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
                    ref.read(cartProvider.notifier).addItem(product, quantity);
                    Modular.to.pop();
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
