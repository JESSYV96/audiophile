import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../colors.dart';

class AppRadioInput<T> extends ConsumerWidget {
  final Widget title;
  final T value;
  final T radioValue;
  final void Function(T?) action;

  const AppRadioInput({
    super.key,
    required this.title,
    required this.value,
    required this.radioValue,
    required this.action,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: title,
      leading: Radio<T>(
        value: value,
        groupValue: radioValue,
        onChanged: action,
        focusColor: AppColors.secondary,
      ),
    );
  }
}
