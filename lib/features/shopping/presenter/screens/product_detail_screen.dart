import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/design_system/widgets/atoms/buttons/text_button.dart';
import '../../../../core/design_system/widgets/molecules/app_bar.dart';
import '../../domain/entities/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(product);
    return Scaffold(
      appBar: defaultAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 65,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                ),
                AppTextButton(
                    text: 'Go back',
                    action: () {
                      Modular.to.pop();
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
