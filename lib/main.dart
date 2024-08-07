import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constants/strings.dart';
import 'package:note_app/cubit/addnote/add_note_cubit_cubit.dart';
import 'package:note_app/cubit/showNotes/show_notes_cubit.dart';
import 'package:note_app/presentation/views/home_page.dart';

import 'data/models/note_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ShowNotesCubit(),
          ),
          BlocProvider(
            create: (context) => AddNoteCubit(),
          ),
        ],
        child: MaterialApp(
          home: const HomePage(),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
        ));
  }
}
