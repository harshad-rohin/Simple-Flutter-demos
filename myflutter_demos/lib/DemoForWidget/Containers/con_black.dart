import 'package:flutter/material.dart';

Widget containerBlack(BuildContext context) {
  return Container(
    color: Color(0xFF292D32),
    // Light shadow: Colors.white.withOpacity(0.1),
    // Dark shadow: Colors.black.withOpacity(0.4),
    width: MediaQuery.of(context).size.width,
    child: Container(
      child: Center(
        child: Text(
            'Container Black',
            style: TextStyle(
              color: Colors.white,
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
        color: Color(0xFF292D32),
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
  );
}