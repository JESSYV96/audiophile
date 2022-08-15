import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/colors.dart';
import '../../../../core/design_system/widgets/atoms/icon.dart';

class QuantityCounter extends ConsumerWidget {
  final int quantity;
  final VoidCallback raiseQuantity;
  final VoidCallback reduceQuantity;

  const QuantityCounter(
      {Key? key,
      required this.quantity,
      required this.raiseQuantity,
      required this.reduceQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 140,
      height: 45,
      color: AppColors.gray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AppIcon(
            icon: Icons.remove,
            color: AppColors.black.withOpacity(0.5),
            size: 14,
            action: reduceQuantity,
          ),
          Text(
            '$quantity',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: AppColors.black),
          ),
          AppIcon(
            icon: Icons.add,
            color: AppColors.black.withOpacity(0.5),
            size: 14,
            action: raiseQuantity,
          ),
        ],
      ),
    );
  }
}
