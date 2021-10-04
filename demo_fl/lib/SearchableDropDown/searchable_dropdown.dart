import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

void main() => const SearchableDropDown();

class SearchableDropDown extends StatefulWidget {
  const SearchableDropDown({Key? key}) : super(key: key);

  @override
  _SearchableDropDownState createState() => _SearchableDropDownState();
}

class _SearchableDropDownState extends State<SearchableDropDown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("DropdownSearch Demo")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: DropdownSearch<String>(
          items: const [
            "Rakesh", "Omkar", "Prathamesh",
            "Mahesh", "Raj", "Kaushik", "Siddhesh",
            "Sanket", "Jayesh"
          ],
          maxHeight: 300,
          //onFind: (String? filter) => ,
          dropdownSearchDecoration: const InputDecoration(
            labelText: "Choose a User",
            contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
            border: OutlineInputBorder(),
          ),
          onChanged: print,
          showSearchBox: true,
        ),
      ),
    );
  }

}
