// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_edit_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteEdit on _NoteEditBase, Store {
  late final _$titleControllerAtom =
      Atom(name: '_NoteEditBase.titleController', context: context);

  @override
  TextEditingController get titleController {
    _$titleControllerAtom.reportRead();
    return super.titleController;
  }

  @override
  set titleController(TextEditingController value) {
    _$titleControllerAtom.reportWrite(value, super.titleController, () {
      super.titleController = value;
    });
  }

  late final _$noteControllerAtom =
      Atom(name: '_NoteEditBase.noteController', context: context);

  @override
  TextEditingController get noteController {
    _$noteControllerAtom.reportRead();
    return super.noteController;
  }

  @override
  set noteController(TextEditingController value) {
    _$noteControllerAtom.reportWrite(value, super.noteController, () {
      super.noteController = value;
    });
  }

  late final _$categoryControllerAtom =
      Atom(name: '_NoteEditBase.categoryController', context: context);

  @override
  TextEditingController get categoryController {
    _$categoryControllerAtom.reportRead();
    return super.categoryController;
  }

  @override
  set categoryController(TextEditingController value) {
    _$categoryControllerAtom.reportWrite(value, super.categoryController, () {
      super.categoryController = value;
    });
  }

  late final _$categoryTextAtom =
      Atom(name: '_NoteEditBase.categoryText', context: context);

  @override
  String get categoryText {
    _$categoryTextAtom.reportRead();
    return super.categoryText;
  }

  @override
  set categoryText(String value) {
    _$categoryTextAtom.reportWrite(value, super.categoryText, () {
      super.categoryText = value;
    });
  }

  @override
  String toString() {
    return '''
titleController: ${titleController},
noteController: ${noteController},
categoryController: ${categoryController},
categoryText: ${categoryText}
    ''';
  }
}
