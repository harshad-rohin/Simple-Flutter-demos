import 'package:flutter/material.dart';

import 'Constants/colors.dart';
import 'StatefulWidget/stateful_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MyColors.greenish,
        scaffoldBackgroundColor: Color(0xFFD2DBE0),
        textTheme: Theme
            .of(context)
            .textTheme
            .apply(
          bodyColor: Colors.black,
          displayColor: Colors.white,
          fontFamily: 'Ubuntu',
        ),
      ),
      home: MyFlutterApp(),
    );
  }
}
