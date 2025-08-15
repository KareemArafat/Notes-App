import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.colorChosen, required this.color});

  final bool colorChosen;
  final List<int> color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Container(
        height: colorChosen ? 80 : 50,
        width: colorChosen ? 80 : 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(color[0]), Color(color[1])]),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

List<List<int>> colorsList = [
  [Colors.deepPurple.toARGB32(), Colors.cyan.toARGB32()],
  [Colors.purple.shade700.toARGB32(), Colors.pink.shade100.toARGB32()],
  [Colors.blue.shade700.toARGB32(), Colors.orange.shade100.toARGB32()],
  [Colors.teal.toARGB32(), Colors.lime.toARGB32()],
  [Colors.deepOrange.toARGB32(), Colors.blueGrey.toARGB32()],
  [Colors.green.toARGB32(), Colors.cyan.toARGB32()],
];
