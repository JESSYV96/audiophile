import 'package:flutter/material.dart';

import '../../../colors.dart';

class FilledButton extends StatelessWidget {
  final String text;
  final void Function() action;

  const FilledButton({Key? key, required this.text, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
        primary: AppColors.secondary,
        fixedSize: const Size(140, 45),
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
