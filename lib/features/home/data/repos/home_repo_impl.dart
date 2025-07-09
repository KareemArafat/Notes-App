import 'package:hive/hive.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<void> addNote({required NoteModel noteModel}) async {
    var note = Hive.box<NoteModel>(kNotesBox);
    await note.add(noteModel);
  }

  @override
  List<NoteModel> showNotes() {
    var note = Hive.box<NoteModel>(kNotesBox);
    List<NoteModel> notesList = note.values.toList();
    return notesList;
  }
}
