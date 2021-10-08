import 'package:demo_fl/Navigation/second_page.dart';
import 'package:demo_fl/Navigation/third_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => const FourthPage();

class FourthPage extends StatefulWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FourthPage'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => const ThirdPage()),
                  );

                  // int count = 0;
                  // Navigator.of(context).popUntil((_) => count++ >= 2);

                });
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text('Pop'),
              ),
            ),
          ),

          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.popUntil(context, ModalRoute.withName('/second'));
                });
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text('PopUntil'),
              ),
            ),
          ),

          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.popAndPushNamed(context, '/second');
                });
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text('PopAndPushNamed'),
              ),
            ),
          )

        ],
      )
    );
  }
}
