import 'package:audiophile/core/utils/amount_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/widgets/atoms/buttons/filled_button.dart';
import '../../../shopping/domain/entities/item.dart';
import '../../../shopping/presenter/providers/cart_provider.dart';
import '../providers/order_form_provider.dart';
import 'checkout_cart_item.dart';
import 'checkout_dialog.dart';

class SummaryPayment extends ConsumerStatefulWidget {

  const SummaryPayment({super.key});

  @override
  _SummaryPayment createState() => _SummaryPayment();
}

class _SummaryPayment extends ConsumerState<SummaryPayment> {
  @override
  Widget build(BuildContext context) {
    final order = ref.watch(orderProvider.state).state;
    final cartState = ref.watch(cartProvider.notifier).getCartState();

    return Container(
        color: AppColors.white,
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
            _itemList(cartState),
            _totalPriceDetails(context, ref),
            AppFilledButton(
              text: AppLocalizations.of(context)!.checkout.toUpperCase(),
              width: MediaQuery.of(context).size.width,
              action: () {
                checkoutDialog(context, order.status);
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
            child: CheckoutCartItem(item: item),
          ),
        )
        .toList(),
  );
}

Widget _totalPriceDetails(BuildContext context, WidgetRef ref) {
  final cartAmount = ref.watch(cartAmountProvider);
  final totalAmount = ref.watch(totalAmountProvider);
  final shippingPrice = ref.watch(shippingPriceProvider);
  final vatAmount = ref.watch(vatProvider);

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.total.toUpperCase()),
            Text(amountFormat.format(cartAmount))
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
            Text(amountFormat.format(vatAmount))
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.totalAmountOrder.toUpperCase()),
            Text(amountFormat.format(totalAmount))
          ],
        ),
      ),
    ],
  );
}
