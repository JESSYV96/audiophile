import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/widgets/atoms/input.dart';
import '../../../../core/theme/widgets/molecules/app_bar.dart';
import '../../../shopping/presenter/providers/cart_provider.dart';

class CheckoutScreen extends ConsumerWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.read(cartProvider.notifier);

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
            _billingDetails(context),
            _shippingInfo(context),
            _paymentDetails(context)
          ],
        ),
      ),
    );
  }

  Widget _billingDetails(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              AppLocalizations.of(context)!.billingDetails.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: AppColors.secondary),
            ),
          ),
          AppInput(
            label: AppLocalizations.of(context)!.name,
            placeholder: 'Bobby Brown',
          ),
          AppInput(
            label: AppLocalizations.of(context)!.emailAddress,
            placeholder: 'jessy.v@gmail.com',
          ),
          AppInput(
            label: AppLocalizations.of(context)!.phoneNumber,
            placeholder: 'jessy.v@gmail.com',
          ),
        ],
      ),
    );
  }

  Widget _shippingInfo(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              AppLocalizations.of(context)!.shippingInfo.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: AppColors.secondary),
            ),
          ),
          AppInput(
            label: AppLocalizations.of(context)!.address,
            placeholder: '20 rue des radars',
          ),
          AppInput(
            label: AppLocalizations.of(context)!.zipCode,
            placeholder: '91000',
          ),
          AppInput(
            label: AppLocalizations.of(context)!.city,
            placeholder: 'Evry',
          ),
          AppInput(
            label: AppLocalizations.of(context)!.country,
            placeholder: 'France',
          ),
        ],
      ),
    );
  }

  Widget _paymentDetails(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        children: [
          Text(AppLocalizations.of(context)!.paymentDetails.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: AppColors.secondary)),
        ],
      ),
    );
  }
}
