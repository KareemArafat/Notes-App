import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.colorChosen, required this.color});

  final bool colorChosen;
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (colorChosen == true) {
      return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          child: CircleAvatar(
            radius: 27,
            backgroundColor: color,
          ),
        ),
      );
    } else {
      return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: CircleAvatar(
          backgroundColor: color,
          radius: 30,
        ),
      );
    }
  }
}
