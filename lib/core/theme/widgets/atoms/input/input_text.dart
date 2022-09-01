import 'package:flutter/material.dart';

class AppTextInput extends StatelessWidget {
  final String label;
  final String? placeholder;
  final String? initialValue;
  const AppTextInput(
      {super.key, required this.label, this.initialValue, this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          TextFormField(
            initialValue: initialValue,
            style: Theme.of(context).textTheme.bodyText1,
            decoration: InputDecoration(
              hintText: placeholder,
              border: const OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
