import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';

import '../../widgets/text/customTextWidget.dart';
import '../../widgets/text/generalTextWidget.dart';
import '../../assets/theme/custom_theme.dart';

import '../../widgets/dividerWidget.dart';
import '../../widgets/noteElementWidget.dart';
import '../viewmodels/note/note_vm.dart';
import '../viewmodels/note_data/note_data_vm.dart';
import 'add_notes_view.dart';

class MainView extends StatefulWidget {
  MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  // final _mainViewModel = MainViewModel();
  final _noteDataBase = NoteData();

  void createNewNote(BuildContext context) {
    //yeni not oluştur
    int id = _noteDataBase.allNotes.length;

    //boş not oluştur
    Note newNote = Note(
      id: id,
      note: "",
      title: "",
      category: "",
      date: "",
    );

    // notu düzenlemeye git
    goToNotePage(context, newNote, true);
  }

  void goToNotePage(BuildContext context, note, bool isNewNote) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNotesView(
          note: note,
          isNewNote: isNewNote,
          noteDataBase: _noteDataBase,
        ),
      ),
    );
  }

  void deleteNote(Note note) {
    _noteDataBase.removeNote(note);
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _noteDataBase.initiizeNotes();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            //--------------BAŞLIK
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: myDarkTheme.colorScheme.secondary,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      GeneralText(
                        text: "morning",
                        isBold: false,
                        size: 13,
                      ),
                      GeneralText(
                        text: ", Justin",
                        isBold: true,
                        size: 13,
                      ),
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        return createNewNote(context);
                      },
                      child: Icon(LineIcons.plus)),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            customDivider(),
            //------------YOUR NOTES
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GeneralText(
                        text: "your",
                        isBold: false,
                        size: MediaQuery.of(context).size.width / 6,
                      ),
                      GeneralText(
                        text: "  notes",
                        isBold: false,
                        size: MediaQuery.of(context).size.width / 6,
                      ),
                    ],
                  ),
                  Observer(builder: (_) {
                    return CustomText(
                      text: "/" + _noteDataBase.allNotes.length.toString(),
                      color: myDarkTheme.colorScheme.onSecondary,
                      isBold: false,
                      size: MediaQuery.of(context).size.width / 9,
                    );
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //-------------- CATEGORY LİST
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Observer(builder: (_) {
                    return Wrap(
                      spacing: 8,
                      children: _noteDataBase.forCategoryList.map(
                        (e) {
                          return Observer(
                            builder: (_) {
                              return FilterChip(
                                backgroundColor:
                                    myDarkTheme.colorScheme.onPrimary,
                                label: CustomText(
                                  text: "#" + e,
                                  isBold: false,
                                  size: 25,
                                  color: _noteDataBase.selectedCategories
                                          .contains(e)
                                      ? myDarkTheme.colorScheme
                                          .primary // Seçili olduğunda yazı rengi
                                      : myDarkTheme.colorScheme
                                          .secondary, // Seçili olmadığında yazı rengi,
                                ),
                                selected: _noteDataBase.selectedCategories
                                    .contains(e),
                                onSelected: (value) {
                                  _noteDataBase.toggleCategory(
                                      e); // MobX store'daki aksiyonu çağır
                                },
                                selectedColor: myDarkTheme.colorScheme.surface,
                                showCheckmark: false,
                              );
                            },
                          );
                        },
                      ).toList(),
                    );
                  }),
                ],
              ),
            ),

            SizedBox(
              height: 30.h,
            ),

            //-----------NOT LİSTESİ
            Observer(builder: (_) {
              return Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.normal,
                  ),
                  scrollDirection: Axis.vertical,
                  child: _noteDataBase.allNotes.length == 0
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: GeneralText(
                              text: "not yok", size: 50, isBold: true),
                        )
                      : Column(
                          children: List.generate(
                              _noteDataBase.filteredNotes.length, (index) {
                            final product = _noteDataBase.filteredNotes[index];
                            return NoteElement(
                              header: product.title,
                              note: product.note,
                              num: (index + 1).toString(),
                              onTap: () =>
                                  goToNotePage(context, product, false),
                            );
                          }),
                        ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
