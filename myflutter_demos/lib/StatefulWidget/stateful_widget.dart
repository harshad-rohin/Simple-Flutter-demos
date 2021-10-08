import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Constants/colors.dart';
import 'next_page.dart';

void main() => const MyFlutterApp();

class MyFlutterApp extends StatefulWidget {
  const MyFlutterApp({Key? key}) : super(key: key);

  @override
  _MyFlutterAppState createState() => _MyFlutterAppState();
}

class _MyFlutterAppState extends State<MyFlutterApp> {
  int _value = 1;
  bool isChecked = false;

  //for Radio button
  int group = 0;

  Map<String, bool> values = {
    'Apple': false,
    'Banana': false,
    'Cherry': false,
    'Mango': false,
    'Orange': false,
  };

  var tmpArray = [];

  getCheckboxItems() {
    values.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });
    print(tmpArray);
    tmpArray.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Stateful Widget'),
      ),
      body: SingleChildScrollView(
       scrollDirection: Axis.vertical,
       child: Form(
         child: Column(
           children: [
             Container(
               alignment: Alignment.center,
               width: MediaQuery.of(context).size.width,
               padding: const EdgeInsets.all(10.0),
               margin: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),

               child: ElevatedButton(
                 child: const Padding(
                   padding: EdgeInsets.all(8.0),
                   child: Text('Next Page'),
                 ),
                 onPressed: () {
                   setState(() {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => NextPage()),
                     );
                   });
                 },
               ),

               decoration: BoxDecoration(
                 color: color,
                 borderRadius: BorderRadius.circular(5),
               ),
             ),

             Container(
               alignment: Alignment.center,
               width: MediaQuery.of(context).size.width,
               height: 80,
               padding: EdgeInsets.all(10.0),
               margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
               child: const TextField(
                 decoration: InputDecoration(
                   hintText: 'hint text',
                   labelText: 'label text',
                 ),
               ),

               decoration: BoxDecoration(
                 color: Colors.blueGrey,
                 borderRadius: BorderRadius.circular(5),
               ),
             ),

             Container(
               alignment: Alignment.center,
               width: MediaQuery.of(context).size.width,
               height: 80,
               padding: const EdgeInsets.all(10.0),
               margin: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
               child: const TextField(
                 decoration: InputDecoration(
                   hintText: 'hint text',
                   labelText: 'label text',
                 ),
                 keyboardType: TextInputType.number,
               ),

               decoration: BoxDecoration(
                 color: Colors.blueGrey,
                 borderRadius: BorderRadius.circular(5),
               ),
             ),

             Container(
               alignment: Alignment.center,
               width: MediaQuery.of(context).size.width,
               height: 80,
               padding: EdgeInsets.all(10.0),
               margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
               child: TextField(
                 obscureText: true,
                 decoration: InputDecoration(
                   hintText: 'hint text',
                   labelText: 'label text',
                 ),
                 keyboardType: TextInputType.text,
               ),

               decoration: BoxDecoration(
                 color: Colors.blueGrey,
                 borderRadius: BorderRadius.circular(5),
               ),
             ),

             Container(
               alignment: Alignment.center,
               width: MediaQuery.of(context).size.width,
               height: 80,
               padding: EdgeInsets.all(10.0),
               margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
               child: DropdownButton<int>(
                 isExpanded: true,
                 items: [
                   DropdownMenuItem(
                     child: Text('First Item'),
                     value: 1,
                   ),
                   DropdownMenuItem(
                     child: Text('Second Item'),
                     value: 2,
                   ),
                   DropdownMenuItem(
                     child: Text('Third Item'),
                     value: 3,
                   )
                 ],
                 value: _value,
                 onChanged: (value) {
                   setState(() {
                     _value = value!;
                   });
                 },
               ),

               decoration: BoxDecoration(
                 color: Colors.blueGrey,
                 borderRadius: BorderRadius.circular(5),
               ),
             ),

             Container(
               alignment: Alignment.center,
               width: MediaQuery.of(context).size.width,
               height: 80,
               padding: EdgeInsets.all(10.0),
               margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
               child: Row(
                 children: [
                   Expanded(
                     child: RadioListTile(
                       value: 0,
                       title: Text('YES'),
                       groupValue: group,
                       onChanged: (int? value) {
                         setState(() {
                           group = value!;
                         });
                       },
                     ),
                   ),

                   Expanded(
                     child: RadioListTile(
                       value: 1,
                       title: Text('NO'),
                       groupValue: group,
                       onChanged: (int? value) {
                         setState(() {
                           group = value!;
                         });
                       },
                     ),
                   ),
                 ],
               ),

               decoration: BoxDecoration(
                 color: Colors.blueGrey,
                 borderRadius: BorderRadius.circular(5),
               ),
             ),

             Container(
               alignment: Alignment.center,
               width: MediaQuery.of(context).size.width,
               height: 80,
               padding: EdgeInsets.all(10.0),
               margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
               child: CheckboxListTile(
                 title: Text('Checkbox 1'),
                 value: isChecked,
                 isThreeLine: false,
                 contentPadding: EdgeInsets.all(0),
                 controlAffinity: ListTileControlAffinity.leading,
                 onChanged: (value) {
                   setState(() {
                     isChecked = value!;
                   });
                 },
               ),

               decoration: BoxDecoration(
                 color: Colors.blueGrey,
                 borderRadius: BorderRadius.circular(5),
               ),
             ),

             Container(
               alignment: Alignment.center,
               width: MediaQuery.of(context).size.width,
               padding: EdgeInsets.all(10.0),
               margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
               child: ListView(
                 shrinkWrap: true,
                 children: values.keys.map((String key) {
                    return CheckboxListTile(
                      title: new Text(key),
                      value: values[key],
                      // activeColor: Colors.pink,
                      // checkColor: Colors.white,
                      onChanged: (bool? value) {
                        setState(() {
                          values[key] = value!;
                        });
                      },
                  );
                 }).toList(),

               ),

               decoration: BoxDecoration(
                 color: Colors.blueGrey,
                 borderRadius: BorderRadius.circular(5),
               ),
             ),

           ],
         ),
       ),
     ),
    );
  }
}
