import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/design_system/colors.dart';
import '../../../../core/design_system/widgets/atoms/buttons/filled_button.dart';
import '../../../../core/layouts/default_layout.dart';
import '../../domain/entities/product.dart';
import '../providers/get_product_provider.dart';
import '../widgets/product_category_list.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _banner(BuildContext context, Product spotlightProduct) {
    double getScreenHeight() {
      const headerSize = 70;
      final fullHeight = MediaQuery.of(context).size.height;

      return fullHeight - headerSize;
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
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: AppColors.gray),
            ),
          ),
          AppFilledButton(
              text: AppLocalizations.of(context)!.seeProduct.toUpperCase(),
              action: () {
                Modular.to.pushNamed('/products/${spotlightProduct.slug}',
                    arguments: spotlightProduct);
              })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Product> spotlightProduct =
        ref.watch(getProductProvider('xx99-mark-2-headphones'));
    return DefaultLayout(
      body: Column(
        children: [
          spotlightProduct.when(
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text(error.toString()),
            data: (product) => _banner(context, product),
          ),
          const ProductCategoryList()
        ],
      ),
    );
  }
}
