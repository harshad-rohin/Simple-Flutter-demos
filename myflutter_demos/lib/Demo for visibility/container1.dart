import 'package:flutter/material.dart';

Widget container1(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(50.0),
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
    child: Center(
      child: Text('Container 1', style: TextStyle(fontSize: 20)),
    ),
  );
}