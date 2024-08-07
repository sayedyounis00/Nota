import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/showNotes/show_notes_cubit.dart';
import 'package:note_app/data/models/note_model.dart';
import 'package:note_app/presentation/widgets/add_note_feild.dart';
import 'package:note_app/presentation/widgets/custom_text_feild.dart';
import 'package:note_app/presentation/widgets/note_item.dart';
import 'package:note_app/presentation/widgets/toggle_swatch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<dynamic> searchedNote;
  late List<NoteModel> noteList;
  List<NoteModel> noteFilterBytag = [];
  final _textEditingControler = TextEditingController();
  final List<String> labels = const ['All', 'Personal', 'Work'];

  int initIndex = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ShowNotesCubit>(context).fetchAllNotes();
  }

  bool isChecked = false;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 32, 127, 190),
        onPressed: () {
          showModalBottomSheet(
              enableDrag: false,
              isDismissible: false,
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              ),
              builder: (context) {
                return AddNoteFeild(formKey: _formKey);
              });
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text('Notes App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: BlocBuilder<ShowNotesCubit, ShowNotesState>(
            builder: (context, state) {
              noteList = BlocProvider.of<ShowNotesCubit>(context).notesList;

              return Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            color: Color.fromARGB(255, 58, 133, 219),
                          ),
                          child: buildTextFeild(),
                        ),
                      ),
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 20.0, bottom: 40),
                  //   child: ToggleeSwitch(
                  //     onToggle: (index) {
                  //       initIndex = index ?? 0;
                  //       addFilterbytag(labels[index!]);
                  //     },
                  //     initIndex: 0,
                  //     labels: labels,
                  //   ),
                  // ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _textEditingControler.text.isEmpty
                        ? noteList.length
                        : searchedNote.length,
                    itemBuilder: (BuildContext context, int index) {
                      log(noteFilterBytag.length);
                      return NoteItem(
                        notes: _textEditingControler.text.isEmpty
                            ? noteList[index]
                            : searchedNote[index],
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildTextFeild() {
    return CustomTextFeild(
      maxLines: 1,
      controller: _textEditingControler,
      onChange: (searcherChar) {
        addSearcherChartoFiltertheList(searcherChar!);
      },
      hintText: 'Search For Note',
      hintColor: Colors.black,
      prefixIcon: const Icon(
        Icons.search,
        color: Colors.black,
      ),
    );
  }

  void addSearcherChartoFiltertheList(String searcherChar) {
    searchedNote = noteList
        .where(
            (charecter) => charecter.title.toLowerCase().contains(searcherChar))
        .toList();
    setState(() {});
  }

  void addFilterbytag(String tag) {
    noteFilterBytag = noteList
        .where((charecter) => charecter.tag!.toLowerCase().contains(tag))
        .toList();
    setState(() {});
  }
}
