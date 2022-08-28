import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        image: DecorationImage(
          image: NetworkImage(
              'https://images.pexels.com/photos/3945667/pexels-photo-3945667.jpeg?auto=compress&cs=tinysrgb&w=800'),
        ),
      ),
    );
  }
}
