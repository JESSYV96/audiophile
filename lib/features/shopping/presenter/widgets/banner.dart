import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/design_system/widgets/atoms/buttons/filled_button.dart';
import '../../domain/entities/product.dart';

class BannerHome extends StatelessWidget {
  final Product spotlightProduct;

  const BannerHome({Key? key, required this.spotlightProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double getScreenHeight() {
      const headerSize = 70;
      final fullHeight = MediaQuery.of(context).size.height;
      final padding = MediaQuery.of(context).padding;

      return fullHeight - padding.top - padding.bottom - headerSize;
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: getScreenHeight(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/xx99-headphone.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                AppLocalizations.of(context)!.newProduct.toUpperCase(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.overline,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                spotlightProduct.name.toUpperCase(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30,
              ),
              child: Text(
                "Experience natural, lifelike audio and exceptional build quality made for the passionate music enthusiast",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            FilledButton(
                text: AppLocalizations.of(context)!.seeProduct.toUpperCase(),
                action: () {
                  Modular.to.pushNamed('/products/${spotlightProduct.slug}',
                      arguments: spotlightProduct);
                })
          ],
        ),
      ),
    );
  }
}
