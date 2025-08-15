import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/features/home/presentation/views/widgets/add_note_sheet.dart';
import 'package:notes_app/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:notes_app/features/home/presentation/views/widgets/note_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const AddNoteSheet();
            },
          );
        },
        backgroundColor: kPrimaryColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [HomeAppBar(), NoteList()]),
      ),
    );
  }
}
