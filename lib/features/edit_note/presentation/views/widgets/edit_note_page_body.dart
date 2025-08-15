import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/core/widgets/custom_text_field.dart';
import 'package:notes_app/features/edit_note/presentation/views/widgets/edit_node_color_list.dart';
import 'package:notes_app/features/edit_note/presentation/views/widgets/edit_note_app_bar.dart';
import 'package:notes_app/features/home/presentation/manager/show_notes_cubit/show_notes_cubit.dart';

class EditNotePageBody extends StatefulWidget {
  const EditNotePageBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNotePageBody> createState() => _EditNotePageBodyState();
}

class _EditNotePageBodyState extends State<EditNotePageBody> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  late NoteModel noteCopy;
  @override
  void initState() {
    super.initState();
    noteCopy = widget.note.copyWith();
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.description);
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EditNoteAppBar(
          press: () {
            widget.note.title = noteCopy.title;
            widget.note.description = noteCopy.description;
            widget.note.colors = List.from(noteCopy.colors);
            widget.note.save();
            BlocProvider.of<ShowNotesCubit>(context).showNotesMethod();
            Navigator.pop(context);
          },
        ),
        Spacer(flex: 1),
        Text(
          'Title',
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        CustomTextField(
          controller: titleController,
          change: (p0) {
            noteCopy.title = p0;
          },
        ),
        Spacer(flex: 1),
        Text(
          'Content',
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        CustomTextField(
          controller: contentController,
          maxLines: 8,
          change: (p0) {
            noteCopy.description = p0;
          },
        ),
        Spacer(flex: 1),
        Text(
          'Color',
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        EditNodeColorList(note: noteCopy),
        Spacer(flex: 2),
      ],
    );
  }
}
