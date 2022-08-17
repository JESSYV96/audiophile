import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/widgets/molecules/app_bar.dart';
import '../../features/shopping/domain/entities/item.dart';
import '../../features/shopping/presenter/providers/get_cart_provider.dart';
import '../design_system/colors.dart';
import '../design_system/widgets/atoms/go_back.dart';

class DefaultLayout extends ConsumerWidget {
  final Widget body;

  const DefaultLayout({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Set<Item>> cart = ref.watch(getCartProvider);

    return Scaffold(
      appBar: defaultAppBar(context, cart),
      body: ListView(
        children: [
          if (Modular.to.canPop()) const GoBack(),
          body,
        ],
      ),
    );
  }
}
