import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/theme/colors.dart';
import '../../domain/entities/order.dart';
import '../../domain/enums/order_status.dart';
import 'card_form.dart';
import 'order_confirmation.dart';

Future<void> checkoutDialog(BuildContext context, Order checkout) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            title: _displayTitleWidgetWhen(
              context: context,
              status: checkout.status,
              totalAmount: checkout.totalAmount,
            ),
            content: _displayContentWidgetWhen(checkout.status));
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
      return Container();
    case OrderStatus.paid:
      return const Text('Bon Bien vu, poto');
    default:
      return throw Exception("Order status Error");
  }
}

Widget _displayContentWidgetWhen(OrderStatus status) {
  switch (status) {
    case OrderStatus.notPaid:
      return const CardForm();
    case OrderStatus.inProgress:
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    case OrderStatus.paid:
      return const OrderConfirmation();
    default:
      return throw Exception("Order status Error");
  }
}
