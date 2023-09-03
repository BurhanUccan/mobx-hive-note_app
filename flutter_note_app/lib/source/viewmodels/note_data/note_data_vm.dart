import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

import '../note/note_vm.dart';
part 'note_data_vm.g.dart';

class NoteData = NoteDataBase with _$NoteData;

abstract class NoteDataBase with Store {
  @observable
  ObservableList<Note> allNotes = ObservableList<Note>.of([]);

  final _myBox = Hive.box('note_database');

  @action
  void initiizeNotes() {
    if (_myBox.get('ALL_NOTES') != null) {
      List<dynamic> savedNotes = _myBox.get('ALL_NOTES');
      for (int i = 0; i < savedNotes.length; i++) {
        Note individualNote = Note(
          id: savedNotes[i][0],
          title: savedNotes[i][1],
          note: savedNotes[i][2],
          category: savedNotes[i][3],
          date: savedNotes[i][4],
        );
        allNotes.add(individualNote);
      }
    }
    categoryListRefresh();
  }

  @action
  void addNewNote(Note note) {
    allNotes.add(note);

    List<List<dynamic>> allNotesFormatted = [];
    for (var note in allNotes) {
      int id = note.id;
      String title = note.title;
      String text = note.note;
      String category = note.category;
      String date = note.date;
      allNotesFormatted.add([id, title, text, category, date]);
    }
    _myBox.put('ALL_NOTES', allNotesFormatted);
  }

  @action
  void updateNote(
      Note note, String title, String text, String category, String date) {
    final index = allNotes.indexWhere((n) => n.id == note.id);
    if (index != -1) {
      allNotes[index].title = title;
      allNotes[index].note = text;
      allNotes[index].category = category;
      allNotes[index].date = date;
    }
    final allNotesFormatted = allNotes
        .map((note) =>
            [note.id, note.title, note.note, note.category, note.date])
        .toList();
    _myBox.put('ALL_NOTES', allNotesFormatted);
  }

  @action
  void removeNote(Note note) {
    allNotes.remove(note);
    final allNotesFormatted = allNotes
        .map((note) =>
            [note.id, note.title, note.note, note.category, note.date])
        .toList();
    _myBox.put('ALL_NOTES', allNotesFormatted);
    forCategoryList.remove(note.category);
  }

//--------------------------- Main view
  @observable
  ObservableSet<String> selectedCategories = ObservableSet<String>();

  @action
  void toggleCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
  }

  @computed
  List<Note> get filteredNotes {
    if (selectedCategories.isEmpty) {
      return allNotes.toList();
    } else {
      return allNotes
          .where((element) => selectedCategories.contains(element.category))
          .toList();
    }
  }

  @observable
  ObservableSet<String> forCategoryList = ObservableSet<String>();

  @action
  void categoryListRefresh() {
    if (allNotes.isNotEmpty) {
      for (var item in allNotes) {
        var varmi = forCategoryList
            .where((element) => element.contains(item.category))
            .firstOrNull;
        if (varmi == null) {
          forCategoryList.add(item.category);
        }
      }
    }
  }
}
