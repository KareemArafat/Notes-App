import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/home/data/repos/home_repo.dart';
import 'package:notes_app/features/home/presentation/views/widgets/color_item.dart';
part 'add_note_cubit_state.dart';

class AddNoteCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubit(this._homeRepo) : super(AddNoteCubitInitial());

  final HomeRepo _homeRepo;
  List<int> baseColors = colorsList[0];

  addNoteMethod(NoteModel note) async {
    note.colors = List.from(baseColors);

    emit(AddNoteLoading());
    try {
      _homeRepo.addNote(noteModel: note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
