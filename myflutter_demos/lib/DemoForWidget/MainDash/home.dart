import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:myflutter_demos/DemoForWidget/pages/first_page.dart';
import 'package:myflutter_demos/DemoForWidget/pages/sec_page.dart';
import 'package:myflutter_demos/DemoForWidget/pages/third_page.dart';

void main() => MainDashBoard();

class MainDashBoard extends StatefulWidget {
  const MainDashBoard({Key? key}) : super(key: key);

  @override
  _MainDashBoardState createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text('Dashboard'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
            padding: EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstPage()),
                );
              },
              child: Text('First Page'),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(10),
            ),
          ),

          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
            padding: EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              child: Text('Second Page'),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(10),
            ),
          ),

          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
            padding: EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdPage()),
                );
              },
              child: Text('Third Page'),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(10),
            ),
          )

        ],
      ),
    );
  }
}
