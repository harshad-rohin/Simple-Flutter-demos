import 'package:flutter/material.dart';
import 'package:myflutter_demos/ParentChild/my_child_widget.dart';

void main() => const MyParentWidget();

class MyParentWidget extends StatefulWidget {
  const MyParentWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyParentWidgetState();
}

class MyParentWidgetState extends State<MyParentWidget> {
  String parentString = 'Parent String';
  void afterChange(changedString) {
    setState(() {
      parentString = changedString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(10.0)),
            Text(
              parentString,
              style: const TextStyle(fontSize: 28),
            ),
            const Padding(padding: EdgeInsets.all(20.0)),

            MyChildWidget(text: 'hello', myFunction: afterChange),

            const Padding(padding: EdgeInsets.all(10.0)),

            ElevatedButton(
              onPressed: (){
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MyParentWidget()),
                      (Route<dynamic> route) => false,
                );
              },
              child: const Icon(Icons.refresh),
            ),

          ],
        ),
      ),
    );
  }
}