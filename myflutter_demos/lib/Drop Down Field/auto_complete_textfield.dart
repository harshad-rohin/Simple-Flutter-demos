import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:myflutter_demos/Drop%20Down%20Field/state_model.dart';

void main() => const AutoCTxtField();

class AutoCTxtField extends StatefulWidget {
  const AutoCTxtField({Key? key}) : super(key: key);

  @override
  _AutoCTxtFieldState createState() => _AutoCTxtFieldState();
}

class _AutoCTxtFieldState extends State<AutoCTxtField> {

  String enteredValue = '';
  String newValue = '';
  final _txtFieldController = TextEditingController();
  List<StateModel> state = [
    StateModel(14, 'Maharashtra'),
  ];

  GlobalKey<AutoCompleteTextFieldState<StateModel>> key1 = GlobalKey();

  List<String> newState = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('AutoComplete TextField'),
      ),
      body: Column(
        children: [
          Padding(
            child: AutoCompleteTextField<StateModel>(
              key: key1,
              controller: _txtFieldController,
              suggestions: state,
              clearOnSubmit: false,
              textInputAction: TextInputAction.none,
              decoration: InputDecoration(
                hintText: 'Enter State Name',
                border: const OutlineInputBorder(),
                suffixIcon: GestureDetector(
                  onTap: (){
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: const Icon(Icons.check_circle, size: 35.0,),
                ),
              ),

              /// [itemBuilder]
              itemBuilder: (context, item) =>
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(item.stateName),
                  ],
                ),
              ),

              /// [itemFilter]
              itemFilter: (item, query) {
                if (item.stateName != query){
                  enteredValue = query;
                }
                return item.stateName.toLowerCase().startsWith(query.toLowerCase());
              },

              /// [itemSorter]
              itemSorter: (a, b) {
                return a.stateName.compareTo(b.stateName);
              },

              /// [itemSubmitted]
              itemSubmitted: (item){
                _txtFieldController.text = item.stateName;
                enteredValue = item.stateName;
              },
            ),
            padding: const EdgeInsets.all(10.0)
          ),

          ElevatedButton(
            onPressed: (){
              bool ch = false;
              try{
                for(var s in state){
                  ch = s.stateName.toLowerCase() == _txtFieldController.text.toLowerCase();
                  if(ch == true){
                    print('true');
                    enteredValue = '';
                    newValue = '';
                    print('old value: ${_txtFieldController.text}');
                    break;
                  }
                }

                if(ch == false){
                  print('if new value entered');
                  newValue = enteredValue;
                  state.add(StateModel(state.last.id + 1, newValue));
                  for(var s in state){
                    print(s.stateName);
                  }
                  print('new value: $newValue');
                }

              }
              catch(e){
                print(e);
              }
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

}
