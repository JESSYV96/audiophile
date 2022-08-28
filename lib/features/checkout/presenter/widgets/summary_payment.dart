import 'package:audiophile/core/utils/amount_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/widgets/atoms/buttons/filled_button.dart';
import '../../../shopping/domain/entities/item.dart';
import '../../domain/services/checkout_service.dart';
import 'checkout_cart_item.dart';
import 'checkout_dialog.dart';

class SummaryPayment extends StatelessWidget {
  final Set<Item> cart;
  const SummaryPayment({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.white,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                AppLocalizations.of(context)!.summary.toUpperCase(),
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            _itemList(cart),
            _totalPriceDetails(context, cart),
            AppFilledButton(
              text: AppLocalizations.of(context)!.checkout,
              width: MediaQuery.of(context).size.width,
              action: () {
                checkoutDialog(context);
              },
            )
          ],
        ));
  }
}

Widget _itemList(Set<Item> cart) {
  return Column(
    children: cart
        .map(
          (item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CartItem(item: item),
          ),
        )
        .toList(),
  );
}

Widget _totalPriceDetails(BuildContext context, Set<Item> cart) {
  final double totalAmount = CheckoutService.getTotalAmount(cart);
  final double shippingPrice = CheckoutService.getShippingPrice();
  final double vat = CheckoutService.getVATAmount(amount: totalAmount);
  final double totalAmountOrder = CheckoutService.getTotalPrice(
    shippingPrice: shippingPrice,
    vat: vat,
    totalItemAmount: totalAmount,
  );
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.total.toUpperCase()),
            Text(amountFormat.format(totalAmount))
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.shipping.toUpperCase()),
            Text(amountFormat.format(shippingPrice))
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.vat.toUpperCase()),
            Text(amountFormat.format(vat))
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.totalAmountOrder.toUpperCase()),
            Text(amountFormat.format(totalAmountOrder))
          ],
        ),
      ),
    ],
  );
}
