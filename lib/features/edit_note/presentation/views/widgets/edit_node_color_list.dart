import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/home/presentation/views/widgets/color_item.dart';

class EditNodeColorList extends StatefulWidget {
  const EditNodeColorList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNodeColorList> createState() => _EditNodeColorListState();
}

class _EditNodeColorListState extends State<EditNodeColorList> {
  int? currentIndex;

  @override
  void initState() {
    super.initState();
    getCurrentColors();
  }

  void getCurrentColors() {
    for (int i = 0; i < colorsList.length; i++) {
      if (listEquals(colorsList[i], widget.note.colors)) {
        currentIndex = i;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colorsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.note.colors = colorsList[index];
              setState(() {});
            },
            child: ColorItem(
              colorChosen: currentIndex == index ? true : false,
              color: colorsList[index],
            ),
          );
        },
      ),
    );
  }
}
