import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/features/home/data/repos/home_repo_impl.dart';
import 'package:notes_app/features/home/presentation/manager/show_notes_cubit/show_notes_cubit.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/home/presentation/views/home_page.dart';
import 'package:notes_app/core/utils/simple_bloc_observer.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowNotesCubit(HomeRepoImpl()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins', brightness: Brightness.dark),
        home: const HomePage(),
      ),
    );
  }
}
