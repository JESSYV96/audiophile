import 'package:audiophile/features/shopping/presenter/widgets/cart/quantity_counter.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/utils/amount_format.dart';
import '../../../domain/entities/item.dart';

class CartItem extends StatelessWidget {
  final Item item;
  const CartItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 80,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            image: DecorationImage(
              image: NetworkImage(item.photoUrl),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.shortName.toString(), // Cut String
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              amountFormat.format(item.amount),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: AppColors.black),
            )
          ],
        ),
        QuantityCounter(
          quantity: item.quantity,
          size: const Size(90, 30),
          raiseQuantity: () {},
          reduceQuantity: () {},
        ),
      ],
    );
  }
}
