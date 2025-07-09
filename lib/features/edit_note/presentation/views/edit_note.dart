import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/home/presentation/manager/show_notes_cubit/show_notes_cubit.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/core/widgets/custom_app_bar.dart';
import 'package:notes_app/core/widgets/custom_text_field.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomAppBar(
              withArrowBack: true,
              title: 'Edit Note',
              icon: Icons.check,
              press: () {
                note.save();
                BlocProvider.of<ShowNotesCubit>(context).showNotesMethod();
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 50),
            CustomTextField(
              text: note.title,
              change: (p0) {
                note.title = p0;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              text: note.description,
              maxLines: 5,
              change: (p0) {
                note.description = p0;
              },
            )
          ],
        ),
      ),
    );
  }
}
