// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_data_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteData on NoteDataBase, Store {
  Computed<List<Note>>? _$filteredNotesComputed;

  @override
  List<Note> get filteredNotes => (_$filteredNotesComputed ??=
          Computed<List<Note>>(() => super.filteredNotes,
              name: 'NoteDataBase.filteredNotes'))
      .value;

  late final _$allNotesAtom =
      Atom(name: 'NoteDataBase.allNotes', context: context);

  @override
  ObservableList<Note> get allNotes {
    _$allNotesAtom.reportRead();
    return super.allNotes;
  }

  @override
  set allNotes(ObservableList<Note> value) {
    _$allNotesAtom.reportWrite(value, super.allNotes, () {
      super.allNotes = value;
    });
  }

  late final _$selectedCategoriesAtom =
      Atom(name: 'NoteDataBase.selectedCategories', context: context);

  @override
  ObservableSet<String> get selectedCategories {
    _$selectedCategoriesAtom.reportRead();
    return super.selectedCategories;
  }

  @override
  set selectedCategories(ObservableSet<String> value) {
    _$selectedCategoriesAtom.reportWrite(value, super.selectedCategories, () {
      super.selectedCategories = value;
    });
  }

  late final _$forCategoryListAtom =
      Atom(name: 'NoteDataBase.forCategoryList', context: context);

  @override
  ObservableSet<String> get forCategoryList {
    _$forCategoryListAtom.reportRead();
    return super.forCategoryList;
  }

  @override
  set forCategoryList(ObservableSet<String> value) {
    _$forCategoryListAtom.reportWrite(value, super.forCategoryList, () {
      super.forCategoryList = value;
    });
  }

  late final _$NoteDataBaseActionController =
      ActionController(name: 'NoteDataBase', context: context);

  @override
  void initiizeNotes() {
    final _$actionInfo = _$NoteDataBaseActionController.startAction(
        name: 'NoteDataBase.initiizeNotes');
    try {
      return super.initiizeNotes();
    } finally {
      _$NoteDataBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNewNote(Note note) {
    final _$actionInfo = _$NoteDataBaseActionController.startAction(
        name: 'NoteDataBase.addNewNote');
    try {
      return super.addNewNote(note);
    } finally {
      _$NoteDataBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateNote(
      Note note, String title, String text, String category, String date) {
    final _$actionInfo = _$NoteDataBaseActionController.startAction(
        name: 'NoteDataBase.updateNote');
    try {
      return super.updateNote(note, title, text, category, date);
    } finally {
      _$NoteDataBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeNote(Note note) {
    final _$actionInfo = _$NoteDataBaseActionController.startAction(
        name: 'NoteDataBase.removeNote');
    try {
      return super.removeNote(note);
    } finally {
      _$NoteDataBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleCategory(String category) {
    final _$actionInfo = _$NoteDataBaseActionController.startAction(
        name: 'NoteDataBase.toggleCategory');
    try {
      return super.toggleCategory(category);
    } finally {
      _$NoteDataBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void categoryListRefresh() {
    final _$actionInfo = _$NoteDataBaseActionController.startAction(
        name: 'NoteDataBase.categoryListRefresh');
    try {
      return super.categoryListRefresh();
    } finally {
      _$NoteDataBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allNotes: ${allNotes},
selectedCategories: ${selectedCategories},
forCategoryList: ${forCategoryList},
filteredNotes: ${filteredNotes}
    ''';
  }
}
