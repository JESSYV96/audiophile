import 'package:flutter/material.dart';

import '../../../colors.dart';

class AppFilledButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final void Function() action;

  const AppFilledButton(
      {Key? key,
      required this.text,
      this.width,
      this.height,
      required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
        primary: AppColors.secondary,
        fixedSize: Size(width ?? 140, height ?? 45),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: AppColors.secondary),
        ),
        textStyle: Theme.of(context).textTheme.subtitle1,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
