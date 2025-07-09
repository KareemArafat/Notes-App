import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.icon,
      this.press,
      this.withArrowBack = false});

  final String title;
  final IconData icon;
  final bool withArrowBack;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(height: 120),
        withArrowBack
            ? GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.arrow_back_ios_new_outlined),
                ))
            : const SizedBox(),
        Text(title, style: const TextStyle(fontSize: 30)),
        const Spacer(),
        Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 1000),
                borderRadius: BorderRadius.circular(12)),
            child: IconButton(
              onPressed: press,
              icon: Icon(icon),
            )),
      ],
    );
  }
}
