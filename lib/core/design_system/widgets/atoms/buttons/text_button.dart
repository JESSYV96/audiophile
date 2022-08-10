import 'package:flutter/material.dart';

import '../../../colors.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final void Function() action;

  const AppTextButton({Key? key, required this.text, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: action,
      child: Text(
        text,
        style: const TextStyle(color: AppColors.fullBlack),
      ),
    );
  }
}
