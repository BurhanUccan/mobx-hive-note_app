import 'package:mobx/mobx.dart';
part 'note_vm.g.dart';

class Note = NoteBase with _$Note;

abstract class NoteBase with Store {
  NoteBase(
      {required this.id,
      required this.title,
      required this.note,
      required this.category,
      required this.date});

  int id;
  @observable
  String title;
  @observable
  String note;
  @observable
  String category;
  @observable
  String date;
}
