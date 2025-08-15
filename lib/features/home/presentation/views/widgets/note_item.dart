import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/home/presentation/manager/show_notes_cubit/show_notes_cubit.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/edit_note/presentation/views/edit_note_page.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNotePage(note: note);
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 16,
          left: 24,
          right: 20,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(note.colors[0]), Color(note.colors[1])],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                note.title,
                style: const TextStyle(color: Colors.black, fontSize: 30),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  note.description,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<ShowNotesCubit>(context).showNotesMethod();
                },
                icon: const Icon(Icons.delete, color: Colors.black, size: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                note.date,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
