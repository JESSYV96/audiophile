import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'buttons/text_button.dart';

class GoBack extends StatelessWidget {
  const GoBack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(left: 20),
        child: AppTextButton(
          text: 'Go back',
          action: () {
            Modular.to.pop();
          },
        ),
      ),
    );
  }
}
