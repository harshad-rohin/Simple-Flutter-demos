import 'package:flutter/material.dart';
import 'package:myflutter_demos/DemoForWidget/Containers/con_blue.dart';
import 'package:myflutter_demos/DemoForWidget/Containers/con_cyan.dart';

void main() => ThirdPage();

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Third Page', style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Orbitron',
          )),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              containerBlue(context),
              containerCyan(context)
            ],
          ),
        )
    );
  }
}
