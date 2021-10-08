import 'package:advanced_search/advanced_search.dart';
import 'package:flutter/material.dart';

void main() => Demo1();

class Demo1 extends StatefulWidget {
  const Demo1({Key? key}) : super(key: key);

  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
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

  final List<String> searchableList = [
    "Orange",
    "Apple",
    "Banana",
    "Mango Orange",
    "Carrot Apple",
    "Yellow Watermelon",
    "Zhe Fruit",
    "White Oats",
    "Dates",
    "Raspberry Blue",
    "Green Grapes",
    "Red Grapes",
    "Dragon Fruit"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('data'),
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 30.0, left: 30, right: 30),
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
                print("selected item Index is $index");
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
        ));
  }
}
