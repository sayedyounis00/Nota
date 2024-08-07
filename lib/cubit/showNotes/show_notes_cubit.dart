import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants/strings.dart';
import 'package:note_app/data/models/note_model.dart';

part 'show_notes_state.dart';

class ShowNotesCubit extends Cubit<ShowNotesState> {
  ShowNotesCubit() : super(ShowNotesInitial());
  List<NoteModel> notesList = [];
  fetchAllNotes() {
    var notes = Hive.box<NoteModel>(kNoteBox);
    notesList = notes.values.toList();
    emit(ShowNotesSuccess());
    log(notesList.toString());
  }
}
