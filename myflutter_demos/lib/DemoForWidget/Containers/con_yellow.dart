import 'package:flutter/material.dart';

Widget containerYellow(BuildContext context) {
  return Container(
    color: Color(0xffffd800),
    // Light shadow: Colors.white.withOpacity(0.1),
    // Dark shadow: Colors.black.withOpacity(0.4),
    width: MediaQuery.of(context).size.width,
    child: Container(
      child: Center(
        child: Text(
            'Container Yellow',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Orbitron',
            )
        ),
      ),
      margin: EdgeInsets.all(20.0),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            offset: Offset(-6.0, -6.0),
            blurRadius: 16.0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: Offset(6.0, 6.0),
            blurRadius: 16.0,
          ),
        ],
        color: Color(0xffffd800),
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
  );
}