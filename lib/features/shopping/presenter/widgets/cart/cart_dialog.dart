import 'package:audiophile/core/design_system/widgets/atoms/buttons/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../core/design_system/colors.dart';
import '../../../../../core/design_system/widgets/atoms/buttons/filled_button.dart';
import '../../../domain/entities/item.dart';
import '../../../domain/services/cart_service.dart';
import '../../../external/datasource/cart/cart_preferences.dart';
import 'cart_item.dart';

Future<void> cartDialog(BuildContext context, AsyncValue<Set<Item>> cart) {
  final amountFormat = NumberFormat.currency(locale: "en_US", symbol: "€");
  late Set<Item> cartItems = {};
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${AppLocalizations.of(context)!.cart} (${cartItems.length})'),
            AppTextButton(
              text: AppLocalizations.of(context)!.removeAll,
              action: () {
                CartPreferences.deleteItems();
                Navigator.pop(context);
              },
            )
          ],
        ),
        content: SingleChildScrollView(
          child: Column(children: [
            cart.when(
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text(
                      error.toString(),
                      style: const TextStyle(color: AppColors.black),
                    ),
                data: (items) {
                  cartItems = items;
                  if (items.isEmpty) {
                    return Text(
                      AppLocalizations.of(context)!.cartIsEmpty,
                      style: const TextStyle(color: AppColors.black),
                    );
                  }
                  return Column(
                    children: items.map((item) => CartItem(item)).toList(),
                  );
                }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.total.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: AppColors.black),
                  ),
                  Text(
                      amountFormat
                          .format(CartService.getTotalAmount(cartItems)),
                      style: Theme.of(context).textTheme.headline5)
                ],
              ),
            ),
            AppFilledButton(
              text: AppLocalizations.of(context)!.checkout.toUpperCase(),
              width: 300,
              action: () {
                Modular.to.pushNamed('/checkout/');
              },
            )
          ]),
        ),
      );
    },
  );
}
