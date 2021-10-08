import 'package:flutter/material.dart';

Widget containerWhite(BuildContext context) {
  return Container(
    color: Color(0xFFEFEEEE),
    // Light shadow: color: Colors.white.withOpacity(0.8),
    // Dark shadow: Colors.black.withOpacity(0.1),
    width: MediaQuery.of(context).size.width,
    child: Container(
      child: Center(
        child: Text(
            'Container White',
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
            color: Colors.white.withOpacity(0.8),
            offset: Offset(-6.0, -6.0),
            blurRadius: 16.0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(6.0, 6.0),
            blurRadius: 16.0,
          ),
        ],
        color: Color(0xFFEFEEEE),
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
  );
}