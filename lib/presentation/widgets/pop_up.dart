import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/cubit/showNotes/show_notes_cubit.dart';
import 'package:note_app/data/models/note_model.dart';

class PopUp extends StatelessWidget {
  const PopUp({super.key,  this.note});
  final NoteModel? note;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowNotesCubit, ShowNotesState>(
      builder: (context, state) {
        return PopupMenuButton(
          initialValue: const Icon(FontAwesomeIcons.ellipsisVertical),
          onSelected: (item) {
            note!.delete();
            log('Deleted');
            BlocProvider.of<ShowNotesCubit>(context).fetchAllNotes();
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            const PopupMenuItem(
              value: '',
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
