import 'package:audiophile/features/order/presenter/providers/order_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../core/theme/widgets/atoms/buttons/filled_button.dart';

class CardForm extends ConsumerWidget {
  const CardForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.read(orderProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: CardFormField(
            onCardChanged: (card) {
              print(card);
            },
          ),
        ),
        AppFilledButton(
          text: AppLocalizations.of(context)!.pay,
          action: () {
            print(order);
          },
          width: MediaQuery.of(context).size.width,
        )
      ],
    );
  }
}
