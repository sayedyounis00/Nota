import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubit/addnote/add_note_cubit_cubit.dart';

import 'package:note_app/cubit/showNotes/show_notes_cubit.dart';
import 'package:note_app/data/models/note_model.dart';
import 'package:note_app/presentation/widgets/custom_text_feild.dart';
import 'package:note_app/presentation/widgets/drop_down_widget.dart';

class AddNoteFeild extends StatefulWidget {
  const AddNoteFeild({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  State<AddNoteFeild> createState() => _AddNoteFeildState();
}

class _AddNoteFeildState extends State<AddNoteFeild> {
  List<String> list = <String>['personal', 'work', 'college', 'home'];
  bool isLoading = false;
  String? tag;

  String? title, desc;
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(microseconds: 700),
      child: BlocProvider(
        create: (context) => AddNoteCubit(),
        child: Container(
          margin: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * .3,
          child: Center(
            child: BlocConsumer<AddNoteCubit, AddNoteCubitState>(
              listener: (context, state) {
                if (state is AddNoteCubitSuccess) {
                  BlocProvider.of<ShowNotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                }
                if (state is AddNoteCubitFailure) {
                  log(state.errMessage.toString());
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Form(
                        key: widget._formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: CustomTextFeild(
                                maxLines: 1,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                onChange: (val) {
                                  title = val;
                                },
                                hintText: 'Add Note title ',
                                hintColor: Colors.grey,
                              ),
                            ),
                            CustomTextFeild(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              onChange: (val) {
                                desc = val;
                              },
                              hintText: 'Add Note desc',
                              hintColor: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DropdownMenuu(),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 37, 134, 187),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (widget._formKey.currentState!.validate()) {
                              NoteModel noteModel = NoteModel(
                                title: title!,
                                description: desc!,
                                date: DateFormat('hh:mm a')
                                    .format(DateTime.now())
                                    .toString(),
                                tag: tag,
                              );
                              BlocProvider.of<AddNoteCubit>(context)
                                  .addNote(noteModel);
                              log(noteModel.tag!.toString());
                              // Navigator.pop(context);
                            } else {
                              return;
                            }
                          },
                          onLongPress: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
