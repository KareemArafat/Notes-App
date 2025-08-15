import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/core/themes/theme_extention.dart';
import 'package:notes_app/features/home/presentation/manager/theme_cubit/theme_cubit.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({super.key});

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: context.isDarkMode ? false : true,
      onChanged: (value) {
        if (context.isDarkMode) {
          BlocProvider.of<ThemeCubit>(context).changeTheme(ThemeMode.light);
        } else {
          BlocProvider.of<ThemeCubit>(context).changeTheme(ThemeMode.dark);
        }
        setState(() {
          value = !value;
        });
      },

      activeColor: kPrimaryColor,
      activeTrackColor: Colors.grey.shade300,
      inactiveThumbColor: Colors.black,
      inactiveTrackColor: Colors.white,
    );
  }
}
