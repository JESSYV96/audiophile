import 'package:audiophile/features/order/presenter/providers/order_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/widgets/loading.dart';
import '../../../shopping/domain/entities/item.dart';
import '../../domain/enums/order_status.dart';
import 'card_form.dart';
import 'order_confirmation.dart';

Future<void> checkoutDialog(BuildContext context, OrderStatus status) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: (status != OrderStatus.paid) ? true : false,
      builder: (BuildContext context) {
        return Consumer(
          builder: (context, ref, _) {
            final order = ref.watch(orderProvider);
            return AlertDialog(
              title: _displayTitleWidgetWhen(
                context: context,
                status: order.status,
                totalAmount: order.totalAmount,
              ),
              content: _displayContentWidgetWhen(
                status: order.status,
                totalAmountOrder: order.totalAmount,
                cart: order.cart,
              ),
            );
          },
        );
      });
}

Widget _displayTitleWidgetWhen({
  required BuildContext context,
  required OrderStatus status,
  required double totalAmount,
}) {
  switch (status) {
    case OrderStatus.notPaid:
      return Text(
        '${AppLocalizations.of(context)!.pay.toUpperCase()} $totalAmount €',
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: AppColors.black),
      );
    case OrderStatus.inProgress:
      return Text(
        '${AppLocalizations.of(context)!.pay.toUpperCase()} $totalAmount €',
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: AppColors.black),
      );
    case OrderStatus.paid:
      const double sizeIconContainer = 50;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: sizeIconContainer,
            height: sizeIconContainer,
            decoration: const BoxDecoration(
              color: AppColors.secondary,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: AppColors.white,
              size: 26,
            ),
          )
        ],
      );
    default:
      throw Exception("Order status Error");
  }
}

ConsumerWidget _displayContentWidgetWhen({
  required OrderStatus status,
  required Set<Item> cart,
  required double totalAmountOrder,
}) {
  switch (status) {
    case OrderStatus.notPaid:
      return const CardForm();
    case OrderStatus.inProgress:
      return const Loading();
    case OrderStatus.paid:
      return OrderConfirmation(cart: cart, totalAmountOrder: totalAmountOrder);
    default:
      throw Exception("Order status Error");
  }
}
