import 'package:flutter/material.dart';

import '../../../../core/layouts/default_layout.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Center(
              child: Text('Checkout Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
