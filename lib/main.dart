import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/core/themes/dark_theme.dart';
import 'package:notes_app/core/themes/light_theme.dart';
import 'package:notes_app/features/home/data/repos/home_repo_impl.dart';
import 'package:notes_app/features/home/presentation/manager/show_notes_cubit/show_notes_cubit.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/home/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:notes_app/features/home/presentation/views/home_page.dart';
import 'package:notes_app/core/utils/simple_bloc_observer.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ShowNotesCubit(HomeRepoImpl())),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightMode(),
            darkTheme: darkMode(),
            themeMode: mode,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
