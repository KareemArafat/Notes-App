import 'package:notes_app/core/models/note_model.dart';

abstract class HomeRepo {
  Future<void> addNote({required NoteModel noteModel});
  List<NoteModel> showNotes();
}
