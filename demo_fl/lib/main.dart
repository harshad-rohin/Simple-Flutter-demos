import 'package:demo_fl/SearchableDropDown/searchable_dropdown.dart';
import 'package:demo_fl/Navigation/first_page.dart';
import 'package:demo_fl/Navigation/fourth_page.dart';
import 'package:demo_fl/Navigation/second_page.dart';
import 'package:demo_fl/Navigation/third_page.dart';
import 'package:flutter/material.dart';

import 'AdditionOfTwoInp/conditional_statement.dart';
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

      initialRoute: '/',
      routes: {
        '/first': (context) => const FirstPage(),
        '/second': (context) => const SecondPage(),
        '/third': (context) => const ThirdPage(),
        '/fourth': (context) => const FourthPage(),
      },

      theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          scaffoldBackgroundColor: Colors.blueGrey,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
          )
      ),
      home: //const FirstPage(),
      const FirstPage(),
      //LoginPage(),
    );
  }
}

