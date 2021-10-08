import 'package:flutter/material.dart';
import 'package:myflutter_demos/Constants/colors.dart';

class MyChildWidget extends StatefulWidget {
  final String text;
  final myFunction;
  const MyChildWidget({Key? key, required this.text, this.myFunction})
      : super(key: key);

  @override
  _MyChildWidgetState createState() => _MyChildWidgetState();
}

class _MyChildWidgetState extends State<MyChildWidget> {
  @override
  Widget build(BuildContext context) {
    /// [passedText] is combined text of parent + child
    String passedText = '${widget.text} world';
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      color: MyColors.greenish,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(passedText, style: const TextStyle(color: Colors.white),),
          RaisedButton(
            child: const Text('Click me to pass child data to parent'),
            onPressed: () {
              widget.myFunction('Passed String from child');
            },
          )
        ],
      )
    );
  }
}
