import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_design/login_screen.dart';
import 'package:flutter_ui_design/uipage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        scaffoldBackgroundColor: Colors.blueGrey,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
        )
      ),
      home: //const HomePage(),
      const HomePage(),
      //LoginPage(),
    );
  }
}

