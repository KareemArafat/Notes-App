import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';

class EditNoteAppBar extends StatelessWidget {
  const EditNoteAppBar({super.key, this.press});
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(height: 110),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        Text('Edit Note', style: const TextStyle(fontSize: 30)),
        const Spacer(),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(onPressed: press, icon: Icon(Icons.check)),
        ),
      ],
    );
  }
}
