import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../core/theme/widgets/atoms/buttons/filled_button.dart';

class CardForm extends StatelessWidget {
  const CardForm({super.key});

  @override
  Widget build(BuildContext context) {
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
          action: () {},
          width: MediaQuery.of(context).size.width,
        )
      ],
    );
  }
}
