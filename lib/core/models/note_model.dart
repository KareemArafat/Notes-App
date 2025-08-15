import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  final String date;
  @HiveField(3)
  List<int> colors;

  NoteModel({
    required this.title,
    required this.description,
    required this.date,
    required this.colors,
  });

  NoteModel copyWith({
    String? title,
    String? description,
    String? date,
    List<int>? colors,
  }) {
    return NoteModel(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      colors: colors != null ? List.from(colors) : List.from(this.colors),
    );
  }
}
