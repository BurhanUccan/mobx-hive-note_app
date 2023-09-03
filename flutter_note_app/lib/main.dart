import 'package:flutter/material.dart';
import 'package:flutter_note_app/assets/theme/custom_theme.dart';

import 'package:flutter_note_app/source/views/main_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hive_flutter/adapters.dart';

void main() async {
// initialize hive
  await Hive.initFlutter();
//open a hive box
  await Hive.openBox('note_database');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(786, 1704),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: myDarkTheme,
          home: MainView(),
        );
      },
    );
  }
}
