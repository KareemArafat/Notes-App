part of 'show_notes_cubit.dart';

@immutable
sealed class ShowNotesState {}

final class ShowNotesInitial extends ShowNotesState {}

final class ShowNotesSuccess extends ShowNotesState {
  final List<NoteModel> notesList;
  ShowNotesSuccess(this.notesList);
}
