import 'package:flutter/material.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/edit_note/presentation/views/widgets/edit_note_page_body.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: EditNotePageBody(note: note),
      ),
    );
  }
}
