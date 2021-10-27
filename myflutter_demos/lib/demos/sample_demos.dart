import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SampleDemos extends StatefulWidget {
  const SampleDemos({Key? key}) : super(key: key);

  @override
  _SampleDemosState createState() => _SampleDemosState();
}

class _SampleDemosState extends State<SampleDemos> {
  TextEditingController date = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    String createDate = formatter.format(DateTime.now());
    date.text = createDate;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Demos'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: TextFormField(
                      controller: date,
                    ),
                    width: 90.0,
                  ),

                  FlatButton(
                    onPressed: (){
                      _selectDate(context);
                    },
                    child: const Icon(Icons.date_range_outlined),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      /// [DateFormat] uses [intl] library => https://pub.dev/packages/intl
      String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
      setState(() {
        selectedDate = picked;
        date.text = formattedDate.toString();
      });
    }
  }
}
