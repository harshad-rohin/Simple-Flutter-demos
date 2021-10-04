import 'package:demo_fl/fourth_page.dart';
import 'package:demo_fl/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => const ThirdPage();

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ThirdPage'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FourthPage()),
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
                    MaterialPageRoute(builder: (context) => const SecondPage()),
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
