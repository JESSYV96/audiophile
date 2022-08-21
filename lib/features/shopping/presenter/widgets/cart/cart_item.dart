import 'package:audiophile/features/shopping/presenter/widgets/cart/quantity_counter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/theme/colors.dart';
import '../../../domain/entities/item.dart';

class CartItem extends StatelessWidget {
  final Item item;
  const CartItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final amountFormat = NumberFormat.currency(locale: "en_US", symbol: "€");

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 80,
          height: 90,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            image: DecorationImage(
              image: NetworkImage(
                  'https://images.pexels.com/photos/3945667/pexels-photo-3945667.jpeg?auto=compress&cs=tinysrgb&w=800'),
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
