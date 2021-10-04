import 'package:demo_fl/first_page.dart';
import 'package:demo_fl/third_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => const SecondPage();

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondPage'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ThirdPage()),
                  );
                });
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text('Push'),
              ),
            ),
          ),

          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => const FirstPage()),
                  );
                });
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text('Pop'),
              ),
            ),
          )

        ],
      )
    );
  }
}
