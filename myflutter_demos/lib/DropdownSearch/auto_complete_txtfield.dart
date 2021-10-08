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
  var _statesController1 = new TextEditingController();
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

            // AdvancedSearch => (https://pub.dev/packages/advanced_search)
            Padding(
                child: Text('Advanced Search'),
                padding: EdgeInsets.all(10.0)
            ),
            SafeArea(
              child: Container(
                margin: const EdgeInsets.only(top: 10.0, left: 30, right: 30, bottom: 10.0),
                child: AdvancedSearch(
                  data: state,
                  maxElementsToDisplay: 10,
                  singleItemHeight: 50,
                  borderColor: Colors.grey,
                  minLettersForSearch: 0,
                  selectedTextColor: Color(0xFF3363D9),
                  fontSize: 14,
                  borderRadius: 12.0,
                  hintText: 'Search Me',
                  cursorColor: Colors.blueGrey,
                  autoCorrect: false,
                  focusedBorderColor: Colors.blue,
                  searchResultsBgColor: Color(0xFAFAFA),
                  disabledBorderColor: Colors.cyan,
                  enabledBorderColor: Colors.black,
                  enabled: true,
                  caseSensitive: false,
                  inputTextFieldBgColor: Colors.white10,
                  clearSearchEnabled: true,
                  itemsShownAtStart: 10,
                  searchMode: SearchMode.CONTAINS,
                  showListOfResults: true,
                  unSelectedTextColor: Colors.black54,
                  verticalPadding: 10,
                  horizontalPadding: 10,
                  hideHintOnTextInputFocus: true,
                  hintTextColor: Colors.grey,
                  onItemTap: (index, value) {
                    //print("selected item Index is $index");
                  },
                  onSearchClear: () {
                    //print("Cleared Search");
                  },
                  onSubmitted: (value, value2) {
                    //print("Submitted: " + value);
                  },
                  onEditingProgress: (value, value2) {
                    //print("TextEdited: " + value);
                    //print("LENGTH: " + value2.length.toString());
                  },
                ),
              ),
            ),

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
            Padding(
                child: Text('Auto Search Input'),
                padding: EdgeInsets.all(10.0)
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
