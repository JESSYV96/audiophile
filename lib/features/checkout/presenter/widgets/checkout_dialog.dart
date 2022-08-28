import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/theme/widgets/atoms/buttons/filled_button.dart';

Future<void> checkoutDialog(BuildContext context) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
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
          ),
        );
      });
}
