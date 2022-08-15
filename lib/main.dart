import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app_module.dart';
import 'app_widget.dart';

import 'features/shopping/external/third_party/hive/cart/cart_box.dart';

void main() async {
  await Hive.initFlutter();
  await CartBox.initCartBox();

  runApp(
    ProviderScope(
      child: ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    ),
  );
}
