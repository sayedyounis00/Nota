import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/addnote/add_note_cubit_cubit.dart';
import 'package:note_app/cubit/showNotes/show_notes_cubit.dart';
import 'package:note_app/data/models/note_model.dart';
import 'package:note_app/presentation/widgets/custom_text_feild.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  @override
  void initState() {
    super.initState();
  }

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Edit Note', style: TextStyle(fontSize: 30)),
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                    BlocProvider.of<ShowNotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                },
                child: const Text(
                  'Done',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFeild(
                hintText: widget.note.title,
                onChange: (value) {
                  widget.note.title = value!;
                  widget.note.save();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFeild(
                hintText: widget.note.description,
                maxLines: 27,
                onChange: (value) {
                  widget.note.description = value!;
                  widget.note.save();
                },
                radius: 0,
                hintColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
