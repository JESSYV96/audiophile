import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/widgets/atoms/buttons/filled_button.dart';
import '../../../../core/utils/amount_format.dart';
import '../../../shopping/domain/entities/item.dart';
import 'checkout_cart_item.dart';

class OrderConfirmation extends StatelessWidget {
  final double totalAmountOrder;
  final Set<Item> cart;

  const OrderConfirmation(
      {super.key, required this.totalAmountOrder, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              AppLocalizations.of(context)!.thankYouForYourOrder.toUpperCase(),
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              AppLocalizations.of(context)!.youWillrecieveConfirmationEmail,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: AppColors.black.withOpacity(0.5),
                  ),
            ),
          ),
          _summaryCart(context, cart: cart, totalAmountOrder: totalAmountOrder),
          AppFilledButton(
            text: AppLocalizations.of(context)!.backToHome.toUpperCase(),
            width: MediaQuery.of(context).size.width,
            action: () {
              Modular.to.navigate('/products/');
            },
          ),
        ],
      ),
    );
  }
}

Widget _summaryCart(BuildContext context,
    {required Set<Item> cart, required double totalAmountOrder}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    child: Column(
      children: [
        Container(
            height: 130,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: AppColors.lightgray,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CheckoutCartItem(item: cart.first),
                const Divider(
                  height: 1,
                  color: AppColors.gray,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.5),
                  child: Text(
                    AppLocalizations.of(context)!.andOtherItem,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: AppColors.black.withOpacity(0.5),
                          fontSize: 10,
                        ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )),
        Container(
          height: 75,
          padding: const EdgeInsets.only(left: 15),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.totalAmountOrder.toUpperCase(),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: AppColors.white.withOpacity(0.5),
                    ),
              ),
              Text(
                amountFormat.format(totalAmountOrder),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: AppColors.white),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
