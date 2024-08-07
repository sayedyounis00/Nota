import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel  extends HiveObject{
  @HiveField(0)
   String title;
  @HiveField(1)
   String description;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final String? tag;

  NoteModel({
     this.tag,
    required this.title,
    required this.description,
    required this.date,
  });
}
