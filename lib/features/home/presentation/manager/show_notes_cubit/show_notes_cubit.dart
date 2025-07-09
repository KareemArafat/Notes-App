import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/home/data/repos/home_repo.dart';
part 'show_notes_state.dart';

class ShowNotesCubit extends Cubit<ShowNotesState> {
  ShowNotesCubit(this._homeRepo) : super(ShowNotesInitial());

  final HomeRepo _homeRepo;
  List<NoteModel>? notes;

  showNotesMethod() {
    notes = _homeRepo.showNotes();
    emit(ShowNotesSuccess(notes!));
  }
}
