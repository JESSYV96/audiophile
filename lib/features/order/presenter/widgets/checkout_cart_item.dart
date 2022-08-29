import 'package:flutter/material.dart';

import '../../../../core/theme/widgets/atoms/image.dart';
import '../../../../core/utils/amount_format.dart';
import '../../../shopping/domain/entities/item.dart';

class CartItem extends StatelessWidget {
  final Item item;

  const CartItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: AppImage(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(item.shortName),
                Text(amountFormat.format(item.amount))
              ],
            ),
          ],
        ),
        Text(
          'x${item.quantity}',
        )
      ],
    );
  }
}
