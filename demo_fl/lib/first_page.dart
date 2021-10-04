import 'package:demo_fl/fourth_page.dart';
import 'package:demo_fl/second_page.dart';
import 'package:demo_fl/third_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => const FirstPage();

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FirstPage'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
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
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const FourthPage(),
                    ),
                        (route) => false,
                  );
                });
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text('pushAndRemoveUntil'),
              ),
            ),
          ),

          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  //Stack having only one page)
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder:
                          (BuildContext context) => const ThirdPage()));
                });
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text('PushReplacementNamed'),
              ),
            ),
          ),

          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/third', (Route<dynamic> route) => false);
                });
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text('pushNamedAndRemoveUntil'),
              ),
            ),
          ),

        ],
      )
    );
  }
}
