import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_note_app/source/views/main_view.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';

import '../../assets/theme/custom_theme.dart';

import '../../widgets/dividerWidget.dart';
import '../../widgets/text/generalTextWidget.dart';

import '../viewmodels/note/note_vm.dart';

import '../viewmodels/note_data/note_data_vm.dart';
import '../viewmodels/note_editing/note_edit_vm.dart';

// ignore: must_be_immutable
class AddNotesView extends StatefulWidget {
  Note note;
  bool isNewNote;
  String Datee = DateTime.now().toString();
  // ignore: prefer_typing_uninitialized_variables
  late final noteDataBase;
  AddNotesView(
      {super.key,
      required this.note,
      required this.isNewNote,
      required this.noteDataBase});

  @override
  State<AddNotesView> createState() => _AddNotesViewState();
}

class _AddNotesViewState extends State<AddNotesView> {
  final _noteEditController = NoteEdit();
  late String tarih;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadExistingNote();
    if (widget.note.date.isNotEmpty) {
      DateTime tarihGecici = DateTime.parse(widget.note.date);
      tarih = DateFormat('dd.MM.yyyy').format(tarihGecici);
    } else
      tarih = "";
  }

  void loadExistingNote() {
    final docTitle = widget.note.title;
    final docNote = widget.note.note;
    final docCategory = widget.note.category;
    _noteEditController.titleController.text = docTitle;
    _noteEditController.noteController.text = docNote;
    _noteEditController.categoryController.text = docCategory;
    _noteEditController.categoryText = docCategory;
    widget.noteDataBase ??= NoteData();
  }

// add new note
  void addNewNote() {
    int id = widget.noteDataBase.allNotes.length;
    String noteText = _noteEditController.noteController.text;
    String titleText = _noteEditController.titleController.text;
    String categoryText = _noteEditController.categoryController.text;
    widget.noteDataBase.addNewNote(
      Note(
          id: id,
          title: titleText,
          note: noteText,
          category: categoryText,
          date: widget.Datee),
    );
  }

  // update note
  void updateNote() {
    String noteText = _noteEditController.noteController.text;
    String titleText = _noteEditController.titleController.text;
    String categoryText = _noteEditController.categoryController.text;
    String dateText = widget.Datee;
    widget.noteDataBase.updateNote(
      widget.note,
      titleText,
      noteText,
      categoryText,
      dateText,
    );
  }

  void removeNote() {
    widget.noteDataBase.removeNote(widget.note);
  }

  void customShowDialog(Function doneAction) {
    showDialog(
      context: context,
      builder: (context) {
        return Observer(builder: (_) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: myDarkTheme.colorScheme.background,
            title: const GeneralText(
                text: "category title", size: 20, isBold: true),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Divider(
                  color: myDarkTheme.colorScheme.secondary,
                ),
                TextField(
                  controller: _noteEditController.categoryController,
                  decoration: const InputDecoration(
                    hintText: 'example',
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Kenar yarıçapını istediğiniz değere ayarlayabilirsiniz.
                    ),
                  ),
                  onPressed: () {
                    if (_noteEditController.categoryController.text.isEmpty) {
                      //toast message
                    } else {
                      doneAction();
                    }
                  },
                  child: const Text(
                    "done",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          );
        });
      },
    );
  }

  void exitDialogBox() {
    Navigator.pop(context);
  }

  void exitNoteEditPage() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return MainView();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // geri butonu
                    Observer(builder: (_) {
                      return InkWell(
                        onTap: () {
                          // eğer başlık ve note dolu olup sadece categorinin boş olduğu durumda
                          if (_noteEditController.noteController.text != "" &&
                              _noteEditController.titleController.text != "" &&
                              _noteEditController.categoryController.text ==
                                  "") {
                            customShowDialog(
                              () {
                                if (widget.isNewNote &&
                                    !_noteEditController
                                        .noteController.text.isEmpty &&
                                    !_noteEditController
                                        .titleController.text.isEmpty &&
                                    !_noteEditController
                                        .categoryController.text.isEmpty) {
                                  addNewNote();
                                } else {
                                  updateNote();
                                }
                                exitNoteEditPage();
                              },
                            );
                          } else if (_noteEditController.noteController.text !=
                                  "" &&
                              _noteEditController.titleController.text != "" &&
                              _noteEditController.categoryController.text !=
                                  "") {
                            if (widget.isNewNote &&
                                !_noteEditController
                                    .noteController.text.isEmpty &&
                                !_noteEditController
                                    .titleController.text.isEmpty &&
                                !_noteEditController
                                    .categoryController.text.isEmpty) {
                              addNewNote();
                            } else {
                              updateNote();
                            }

                            exitNoteEditPage();
                          } else {
                            Fluttertoast.showToast(
                                msg: "Bu not Kaydedilmemiştir",
                                textColor: myDarkTheme.colorScheme.primary,
                                backgroundColor:
                                    myDarkTheme.colorScheme.secondary,
                                gravity: ToastGravity.BOTTOM,
                                fontSize: 15);
                            exitNoteEditPage();
                          }
                        },
                        child: Icon(
                          LineIcons.arrowLeft,
                        ),
                      );
                    }),
                    InkWell(
                        onTap: () {
                          removeNote();

                          Navigator.pop(context);
                        },
                        child: Icon(
                          LineIcons.trash,
                          color: Colors.red,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              customDivider(),
              SizedBox(
                height: 18.h,
              ),
              Observer(builder: (_) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GeneralText(text: tarih, size: 15, isBold: false),
                      Container(
                        alignment: Alignment.centerRight,
                        width: 200.w,
                        child: InkWell(
                          onTap: () {
                            customShowDialog(() {
                              if (!widget.isNewNote) {
                                updateNote();
                              }
                              exitDialogBox();
                              _noteEditController.categoryText =
                                  _noteEditController.categoryController.text;
                            });
                          },
                          child: GeneralText(
                              text: "#" + _noteEditController.categoryText,
                              size: 15,
                              isBold: false),
                        ),
                      )
                    ],
                  ),
                );
              }),
              SizedBox(
                height: 30.h,
              ),
              Observer(
                builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        TextFormField(
                          style: GoogleFonts.oxygen(
                            fontSize: 30,
                            color: myDarkTheme.colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            hintText: "title",
                            hintStyle: GoogleFonts.oxygen(
                              fontSize: 30,
                              color: myDarkTheme.colorScheme.onSecondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          maxLines: null,
                          controller: _noteEditController.titleController,
                        ),
                        TextField(
                          style: GoogleFonts.oxygen(
                            fontSize: 18,
                            color: myDarkTheme.colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            hintText: "note",
                            hintStyle: GoogleFonts.oxygen(
                              fontSize: 18,
                              color: myDarkTheme.colorScheme.onSecondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          maxLines: null,
                          controller: _noteEditController.noteController,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
