import 'package:flutter/material.dart';
import 'package:myflutter_demos/DemoForWidget/Containers/con_cyan.dart';

void main() => FirstPage();

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('First Page', style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Orbitron',
        )),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // containerBlack(context),
            // containerWhite(context),
            // containerYellow(context),
            // containerBlue(context),
            containerCyan(context)
          ],
        ),
      )
    );
  }
}
