import 'package:flutter/material.dart';
import 'package:search_choices/search_choices.dart';

import 'autocomplete_txtview.dart';

void main() => SearchableDrop();

class SearchableDrop extends StatefulWidget {
  const SearchableDrop({Key? key}) : super(key: key);

  @override
  _SearchableDropState createState() => _SearchableDropState();
}

class _SearchableDropState extends State<SearchableDrop> {
  final _formKey = GlobalKey<FormState>();
  String? selectedValueSingleDialogEditableItems;
  List<DropdownMenuItem> editableItems = [];
  String inputString = "";
  TextFormField? input;

  // addItemDialog() async {
  //   return await showDialog(
  //     context: AutoTxtView.navKey.currentState?.overlay?.context ?? context,
  //     builder: (BuildContext alertContext) {
  //       return (AlertDialog(
  //         title: Text("Add an item"),
  //         content: Form(
  //           key: _formKey,
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: <Widget>[
  //               input ?? SizedBox.shrink(),
  //               TextButton(
  //                 onPressed: () {
  //                   if (_formKey.currentState?.validate() ?? false) {
  //                     setState(() {
  //                       editableItems.add(DropdownMenuItem(
  //                         child: Text(inputString),
  //                         value: inputString,
  //                       ));
  //                     });
  //                     Navigator.pop(alertContext, inputString);
  //                   }
  //                 },
  //                 child: Text("Ok"),
  //               ),
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.pop(alertContext, null);
  //                 },
  //                 child: Text("Cancel"),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ));
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Container(
        child: SearchChoices.single(
        items: editableItems,
        value: selectedValueSingleDialogEditableItems,
        hint: "Select one",
        searchHint: "Select one",
        disabledHint: (Function updateParent) {
          return (TextButton(
            onPressed: () {
              //addItemDialog().then((value) async {
              updateParent();
              //});
            },
            child: Text("No choice, click to add one"),
          ));
        },
        closeButton:
            (String? value, BuildContext closeContext, Function updateParent) {
          return (editableItems.length >= 100
              ? "Close"
              : TextButton(
            onPressed: () {
              // addItemDialog().then((value) async {
              //   if (value != null &&
              //       editableItems.indexWhere(
              //               (element) => element.value == value) !=
              //           -1) {
              //     Navigator.pop(
              //         AutoTxtView.navKey.currentState?.overlay?.context ??
              //             context);
              //     updateParent(value);
              //   }
              // });

              updateParent(value);
            },
            child: Text("Add and select item"),
          ));
        },
        onChanged: (String? value) {
          setState(() {
            if (!(value is NotGiven)) {
              selectedValueSingleDialogEditableItems = value;
            }
          });
        },
        displayItem: (item, selected, Function updateParent) {
          return (Row(children: [
            selected
                ? Icon(
              Icons.check,
              color: Colors.green,
            )
                : Icon(
              Icons.check_box_outline_blank,
              color: Colors.transparent,
            ),
            SizedBox(width: 7),
            Expanded(
              child: item,
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                editableItems.removeWhere((element) => item == element);
                updateParent(null);
                setState(() {});
              },
            ),
          ]));
        },
        dialogBox: true,
        isExpanded: true,
        doneButton: "Done",
      ),
      ),
    );
  }
}
