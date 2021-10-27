import 'package:flutter/material.dart';

import 'Constants/colors.dart';
import 'Drop Down Field/auto_complete_textfield.dart';
import 'demos/expanded_panel.dart';

void main() {
  runApp(const MyApp());
}
/// [MyApp] is a main class of our project
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MyColors.greenish,
        scaffoldBackgroundColor: const Color(0xFFD2DBE0),
        textTheme: Theme
            .of(context)
            .textTheme
            .apply(
          bodyColor: Colors.black,
          displayColor: Colors.white,
          fontFamily: 'Ubuntu',
        ),
      ),
      home: const AutoCTxtField(),
    );
  }
}
