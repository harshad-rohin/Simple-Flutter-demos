import 'package:flutter/material.dart';

Widget container2(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(50.0),
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
    child: Center(
      child: Text('Container 2', style: TextStyle(fontSize: 20)),
    ),
  );
}