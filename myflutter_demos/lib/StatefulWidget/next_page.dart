import 'package:flutter/material.dart';
import 'package:myflutter_demos/StatefulWidget/stateful_widget.dart';

void main() => NextPage();

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('previous Page'),
          onPressed: () {
            print('hello');
            setState(() {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => MyFlutterApp()),
              );
            });
          },
        ),
      ),
    );
  }
}
