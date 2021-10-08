import 'package:flutter/material.dart';
import 'package:myflutter_demos/DemoForWidget/Containers/con_black.dart';
import 'package:myflutter_demos/DemoForWidget/Containers/con_white.dart';
import 'package:myflutter_demos/DemoForWidget/Containers/con_yellow.dart';

void main() => SecondPage();

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Second Page', style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Orbitron',
          )),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              containerBlack(context),
              containerWhite(context),
              containerYellow(context),
            ],
          ),
        )
    );
  }
}
