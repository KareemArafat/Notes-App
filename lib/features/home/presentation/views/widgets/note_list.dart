import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/home/presentation/manager/show_notes_cubit/show_notes_cubit.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/home/presentation/views/widgets/note_card.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key});

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  void initState() {
    BlocProvider.of<ShowNotesCubit>(context).showNotesMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowNotesCubit, ShowNotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<ShowNotesCubit>(context).notes ?? [];
        return Expanded(
          child: ListView.builder(
            itemCount: notes.length,
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: NoteCard(note: notes[index]),
              );
            },
          ),
        );
      },
    );
  }
}
