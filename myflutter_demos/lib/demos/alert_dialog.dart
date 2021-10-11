import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => const AlertDialogBox();

class AlertDialogBox extends StatefulWidget {
  const AlertDialogBox({Key? key}) : super(key: key);

  @override
  _AlertDialogBoxState createState() => _AlertDialogBoxState();
}

class _AlertDialogBoxState extends State<AlertDialogBox> {
  var f = NumberFormat("00.00", "en_US");
  String addition = '';
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demos'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Addition of num1 & num2 is: $addition'),
              ),
              ElevatedButton(
                onPressed: (){
                  _displayDialog(context);
                },
                child: const Text('Open Dialog box'),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('TextField AlertDemo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  controller: num1,
                  decoration: const InputDecoration(hintText: "num1"),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: num2,
                  decoration: const InputDecoration(hintText: "num2"),
                ),

                const Padding(padding: EdgeInsets.all(10.0)),

                ElevatedButton(
                  child: const Text('SUBMIT'),
                  onPressed: () {
                    setState(() {
                      addition = f.format(double.parse(num1.text) + double.parse(num2.text));
                    });
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        }
    );
  }

}
