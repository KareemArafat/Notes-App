import 'package:flutter/material.dart';
import 'package:notes_app/features/home/presentation/views/widgets/theme_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(height: 110),
        Text('My Notes', style: const TextStyle(fontSize: 30)),
        const Spacer(),
        ThemeButton(),
      ],
    );
  }
}
