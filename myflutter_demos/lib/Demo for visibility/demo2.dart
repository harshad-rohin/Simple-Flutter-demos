import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'container1.dart';
import 'container2.dart';
import 'container3.dart';

void main() => Demo2();

class Demo2 extends StatefulWidget {
  const Demo2({Key? key}) : super(key: key);

  @override
  _Demo2State createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {
  // final _containerKey1 = GlobalKey();
  // final _containerKey2 = GlobalKey();

  bool conVis1 = true;
  bool conVis2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      conVis1 = false;
                    });
                  },
                  child: Text('Hide Container 1'),
                ),

                Padding(padding: EdgeInsets.all(5.0)),

                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      conVis2 = false;
                    });
                  },
                  child: Text('Hide Container 2'),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      conVis1 = true;
                    });
                  },
                  child: Text('Show Container 1'),
                ),

                Padding(padding: EdgeInsets.all(5.0)),

                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      conVis2 = true;
                    });
                  },
                  child: Text('Show Container 2'),
                ),
              ],
            ),

            Visibility(
              visible: conVis1,
              child: container1(context),
            ),

            Visibility(
              visible: conVis2,
              child: container2(context),
            ),

            Visibility(
              visible: true,
              child: container3(context),
            ),

          ],
        ),
      ),
    );
  }
}
