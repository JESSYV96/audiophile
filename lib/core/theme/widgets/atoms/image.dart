import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String photoUrl;
  const AppImage(this.photoUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        image: DecorationImage(
          image: NetworkImage(photoUrl),
        ),
      ),
    );
  }
}
