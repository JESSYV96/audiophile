import 'package:audiophile/core/theme/widgets/atoms/buttons/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/widgets/atoms/buttons/filled_button.dart';
import '../../../../../core/utils/amount_format.dart';
import '../../../domain/services/cart_service.dart';
import '../../providers/cart_provider.dart';
import 'cart_item.dart';

Future<void> cartDialog(BuildContext context, CartNotifier notifier) {

  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                '${AppLocalizations.of(context)!.cart} (${notifier.getCartState().length})'),
            AppTextButton(
              text: AppLocalizations.of(context)!.removeAll,
              action: () {
                notifier.clear();
                Navigator.pop(context);
              },
            )
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              if (notifier.getCartState().isEmpty)
                Text(
                  AppLocalizations.of(context)!.cartIsEmpty,
                  style: const TextStyle(color: AppColors.black),
                ),
              if (notifier.getCartState().isNotEmpty)
                Column(
                  children: notifier
                      .getCartState()
                      .map((item) => CartItem(item))
                      .toList(),
                ),
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
                        amountFormat.format(CartService.getTotalAmount(
                            notifier.getCartState())),
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
            ],
          ),
        ),
      );
    },
  );
}
