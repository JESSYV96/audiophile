import 'package:flutter/material.dart';

import '../../../../../core/theme/colors.dart';

class PhotoSlot extends StatelessWidget {
  final String photoUrl;
  const PhotoSlot(this.photoUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightgray,
      padding: const EdgeInsets.all(50),
      margin: const EdgeInsets.only(bottom: 25),
      child: Image.network(
        photoUrl,
        width: 200,
        height: 200,
      ),
    );
  }
}
