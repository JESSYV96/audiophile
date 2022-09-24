import 'dart:io' show Platform;
import 'package:audiophile/features/order/domain/enums/order_status.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:flutter_stripe_web/flutter_stripe_web.dart';

import '../../../../core/theme/widgets/atoms/buttons/filled_button.dart';
import '../providers/order_form_provider.dart';

class CardForm extends ConsumerWidget {
  const CardForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (kIsWeb)
          const Text('Stripe web form')
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 15),
        //   child: PaymentElement(
        //     onCardChanged: (card) {
        //       print(card);
        //     },
        //     clientSecret: '${id}_secret_${secret}'
        //   ),
        // )
        else if (Platform.isAndroid || Platform.isIOS)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: CardFormField(
              onCardChanged: (card) {
                // ignore: avoid_print
                print(card);
              },
            ),
          ),
        AppFilledButton(
          text: AppLocalizations.of(context)!.pay,
          action: () {
            ref.read(orderStatusProvider.notifier).state =
                OrderStatus.inProgress;
          },
          width: MediaQuery.of(context).size.width,
        )
      ],
    );
  }
}
