import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'note_edit_vm.g.dart';

// ignore: library_private_types_in_public_api
class NoteEdit = _NoteEditBase with _$NoteEdit;

abstract class _NoteEditBase with Store {
  @observable
  TextEditingController titleController = TextEditingController();
  @observable
  TextEditingController noteController = TextEditingController();
  @observable
  TextEditingController categoryController = TextEditingController();
  @observable
  String categoryText = "";

  // Diğer MobX kodları buraya eklenebilir
}
