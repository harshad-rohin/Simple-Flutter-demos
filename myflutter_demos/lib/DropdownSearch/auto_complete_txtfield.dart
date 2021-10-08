import 'package:advanced_search/advanced_search.dart';
import 'package:auto_search/auto_search.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

void main() => ACTxtField();

class ACTxtField extends StatefulWidget {
  const ACTxtField({Key? key}) : super(key: key);

  @override
  _ACTxtFieldState createState() => _ACTxtFieldState();
}

class _ACTxtFieldState extends State<ACTxtField> {
  List<String> state = [ "Andhra Pradesh",
  "Arunachal Pradesh",
  "Assam",
  "Bihar",
  "Chhattisgarh",
  "Goa",
  "Gujarat",
  "Haryana",
  "Himachal Pradesh",
  "Jammu and Kashmir",
  "Jharkhand",
  "Karnataka",
  "Kerala",
  "Madhya Pradesh",
  "Maharashtra",
  "Manipur",
  "Meghalaya",
  "Mizoram",
  "Nagaland",
  "Odisha",
  "Punjab",
  "Rajasthan",
  "Sikkim",
  "Tamil Nadu",
  "Telangana",
  "Tripura",
  "Uttarakhand",
  "Uttar Pradesh",
  "West Bengal",
  "Andaman and Nicobar Islands",
  "Chandigarh",
  "Dadra and Nagar Haveli",
  "Daman and Diu",
  "Delhi",
  "Lakshadweep",
  "Puducherry"];

  var _statesController = new TextEditingController();
  String txt = "";
  bool no = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AutoCompleteTxtField'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // autocomplete_TextField => (https://pub.dev/packages/autocomplete_textfield)
            Padding(
              child: Text('autocomplete TextField'),
              padding: EdgeInsets.all(10.0)
            ),

            Padding(
              child: AutoCompleteTextField(
                controller: _statesController,
                suggestions: state,
                clearOnSubmit: false,
                textInputAction: TextInputAction.none,
                decoration: InputDecoration(
                  hintText: 'Enter State Name',
                  border: OutlineInputBorder(),
                ),
                itemFilter: (String item, String query) {
                  return item.toLowerCase().startsWith(query.toLowerCase());
                },
                itemSorter: (String a, String b){
                  return a.compareTo(b);
                },
                itemSubmitted: (String item){
                  _statesController.text = item;
                },
                itemBuilder: (context, String item){
                  return Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(item),
                      ],
                    ),
                  );
                },
              ),
              padding: EdgeInsets.all(10.0)
            ),

            Padding(
                child: Text('Entered Text is: $txt', style: TextStyle(fontSize: 20,),),
                padding: EdgeInsets.all(20.0)
            ),

            ElevatedButton(
              onPressed: (){
                setState(() {
                  txt = _statesController.text;
                });
              },
              child: Text('Click Here to View Text'),
            ),

            // autocomplete_TextField => https://pub.dev/packages/auto_search
            const Padding(
                child: Text('Auto Search Input'),
                padding: EdgeInsets.only(top: 30, bottom: 10)
            ),

            Padding(
              child: AutoSearchInput(
                hintText: 'Select State',
                data: state,
                maxElementsToDisplay: 10,
                onItemTap: (index) {},
              ),
              padding: EdgeInsets.all(10)
            ),

          ],
        ),
      )
    );
  }

}
