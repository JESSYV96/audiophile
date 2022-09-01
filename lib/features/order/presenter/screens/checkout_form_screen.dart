import 'package:audiophile/core/theme/widgets/atoms/input/input_radio.dart';
import 'package:audiophile/features/order/domain/entities/purchaser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/widgets/atoms/input/input_text.dart';
import '../../../../core/theme/widgets/molecules/app_bar.dart';
import '../../../shopping/presenter/providers/cart_provider.dart';
import '../../domain/enums/payement_method.dart';
import '../providers/order_form_provider.dart';
import '../widgets/summary_payment.dart';

class OrderScreen extends ConsumerWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.read(cartProvider.notifier);
    final order = ref.read(orderProvider);

    return Scaffold(
      appBar: defaultAppBar(context, cartNotifier),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Text(AppLocalizations.of(context)!.checkout,
                  style: Theme.of(context).textTheme.headline2),
            ),
            _billingDetails(context, order.purchaser),
            _shippingInfo(context),
            _paymentDetails(context, ref),
            const SummaryPayment()
          ],
        ),
      ),
    );
  }

  Widget _billingDetails(BuildContext context, Purchaser purchaser) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Text(
              AppLocalizations.of(context)!.billingDetails.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: AppColors.secondary),
            ),
          ),
          AppTextInput(
            label: AppLocalizations.of(context)!.name,
            placeholder: 'Bobby Brown',
            initialValue: purchaser.name,
          ),
          AppTextInput(
            label: AppLocalizations.of(context)!.emailAddress,
            placeholder: 'jessy.v@gmail.com',
            initialValue: purchaser.email,
          ),
          AppTextInput(
            label: AppLocalizations.of(context)!.phoneNumber,
            placeholder: '0601020304',
            initialValue: purchaser.phoneNumber,
          ),
        ],
      ),
    );
  }

  Widget _shippingInfo(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Text(
              AppLocalizations.of(context)!.shippingInfo.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: AppColors.secondary),
            ),
          ),
          AppTextInput(
            label: AppLocalizations.of(context)!.address,
            placeholder: 'Avenue des champs élysées',
            initialValue: 'test'
          ),
          AppTextInput(
            label: AppLocalizations.of(context)!.zipCode,
            placeholder: '75016',
            initialValue: '00000'
          ),
          AppTextInput(
            label: AppLocalizations.of(context)!.city,
            placeholder: 'Paris',
            initialValue: 'Ville'
          ),
          AppTextInput(
            label: AppLocalizations.of(context)!.country,
            placeholder: 'France',
            initialValue: 'Pays',
          ),
        ],
      ),
    );
  }

  Widget _paymentDetails(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              AppLocalizations.of(context)!.paymentDetails.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: AppColors.secondary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: AppRadioInput<PaymentMethods>(
                title: Text(AppLocalizations.of(context)!.creditCard,
                    style: Theme.of(context).textTheme.bodyText1),
                value: PaymentMethods.creditCart,
                radioValue: ref.watch(paymentMethodProvider),
                action: (value) {
                  ref.read(paymentMethodProvider.notifier).state =
                      PaymentMethods.creditCart;
                }),
          ),
          AppRadioInput<PaymentMethods>(
            title: Text(AppLocalizations.of(context)!.cashOnDelivery,
                style: Theme.of(context).textTheme.bodyText1),
            value: PaymentMethods.cashOnDelivery,
            radioValue: ref.watch(paymentMethodProvider),
            action: (value) {
              ref.read(paymentMethodProvider.notifier).state =
                  PaymentMethods.cashOnDelivery;
            },
          ),
        ],
      ),
    );
  }
}
