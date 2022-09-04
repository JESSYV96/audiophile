import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/order/domain/enums/order_status.dart';
import '../../../features/order/presenter/providers/order_form_provider.dart';

class Loading extends ConsumerWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 2), () {
      ref.read(orderStatusProvider.notifier).state = OrderStatus.paid;
    });
    return const SizedBox(
      height: 65,
      child: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
