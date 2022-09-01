import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/widgets/atoms/image.dart';
import '../../../../core/utils/amount_format.dart';
import '../../../shopping/domain/entities/item.dart';

class CheckoutCartItem extends StatelessWidget {
  final Item item;

  const CheckoutCartItem({super.key, required this.item});

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
                Text(
                  item.shortName,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  amountFormat.format(item.amount),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: AppColors.black.withOpacity(0.5),
                      ),
                )
              ],
            ),
          ],
        ),
        Text(
          'x${item.quantity}',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: AppColors.black.withOpacity(0.5),
              ),
        )
      ],
    );
  }
}
