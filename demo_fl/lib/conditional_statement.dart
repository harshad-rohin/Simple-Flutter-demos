import 'package:flutter/material.dart';
import 'widget_provider.dart';

void main() => const ConStmt();

class ConStmt extends StatefulWidget {
  const ConStmt({Key? key}) : super(key: key);

  @override
  _ConStmtState createState() => _ConStmtState();
}

class _ConStmtState extends State<ConStmt> {
  final _value1 = TextEditingController();
  final _value2 = TextEditingController();
  double num = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Form(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.height * 0.47,
                child: TextFormField(
                  controller: _value1,
                  keyboardType: TextInputType.number,
                  //textCapitalization: TextCapitalization.words,
                  cursorHeight: 25,
                  style: const TextStyle(fontSize: 20),
                  decoration: input,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.height * 0.47,
                child: TextFormField(
                  controller: _value2,
                  keyboardType: TextInputType.number,
                  //textCapitalization: TextCapitalization.words,
                  cursorHeight: 25,
                  style: const TextStyle(fontSize: 20),
                  decoration: input,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.height * 0.47,
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          if (_value1.text.isEmpty || _value2.text.isEmpty){
                            const snackBar = SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Input value is empty!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'sans-serif-thin',
                                ),
                              )
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                          else{
                            num = double.parse(_value1.text) + double.parse(_value2.text);
                          }
                        });
                      },
                      child: const Padding(
                          child: Text('ADD'),
                          padding: EdgeInsets.all(10)
                      )
                  )
              ),
            ),
            Container(
              color: Colors.orange,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.height * 0.47,
                child: Text('Addition of 2 Input is: $num',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'sans-serif-thin',
                    fontWeight: FontWeight.bold,
                  ),),
              ),
            )

          ],
        ),
      )
    );
  }
}

