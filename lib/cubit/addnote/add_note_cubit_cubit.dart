import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants/strings.dart';
import 'package:note_app/data/models/note_model.dart';

part 'add_note_cubit_state.dart';

class AddNoteCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubit() : super(AddNoteCubitInitial());
  addNote(NoteModel note) async {
    emit(AddNoteCubitLoading());
    try {
      var notesBox = await Hive.openBox<NoteModel>(kNoteBox);
      notesBox.add(note);
      emit(AddNoteCubitSuccess());
    } catch (e) {
      emit(AddNoteCubitFailure(errMessage: e.toString()));
    }
  }
}
