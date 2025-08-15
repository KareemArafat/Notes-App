import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/features/home/presentation/views/widgets/color_item.dart';

class ColorsList extends StatefulWidget {
  const ColorsList({super.key});

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colorsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              BlocProvider.of<AddNoteCubit>(context).baseColors =
                  colorsList[index];
              setState(() {});
            },
            child: ColorItem(
              color: colorsList[index],
              colorChosen: currentIndex == index ? true : false,
            ),
          );
        },
      ),
    );
  }
}
