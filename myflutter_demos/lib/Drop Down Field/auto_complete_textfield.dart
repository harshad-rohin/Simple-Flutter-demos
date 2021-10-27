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
    StateModel(0, 'Andhra Pradesh'),
    StateModel(1, 'Arunachal Pradesh'),
    StateModel(2, 'Assam'),
    StateModel(3, 'Bihar'),
    StateModel(4, 'Chhattisgarh'),
    StateModel(5, 'Goa'),
    StateModel(6, 'Gujarat'),
    StateModel(7, 'Haryana'),
    StateModel(8, 'Himachal Pradesh'),
    StateModel(9, 'Jammu and Kashmir'),
    StateModel(10, 'Jharkhand'),
    StateModel(11, 'Karnataka'),
    StateModel(12, 'Kerala'),
    StateModel(13, 'Madhya Pradesh'),
    StateModel(14, 'Maharashtra'),
    StateModel(15, 'Manipur'),
    StateModel(16, 'Meghalaya'),
    StateModel(17, 'Mizoram'),
    StateModel(18, 'Nagaland'),
    StateModel(19, 'Odisha'),
    StateModel(20, 'Punjab'),
    StateModel(21, 'Rajasthan'),
    StateModel(22, 'Sikkim'),
    StateModel(23, 'Tamil Nadu'),
    StateModel(24, 'Telangana'),
    StateModel(25, 'Tripura'),
    StateModel(26, 'Uttarakhand'),
    StateModel(27, 'Uttar Pradesh'),
    StateModel(28, 'West Bengal'),
    StateModel(29, 'Andaman and Nicobar Islands'),
    StateModel(30, 'Chandigarh'),
    StateModel(31, 'Dadra and Nagar Haveli'),
    StateModel(32, 'Daman and Diu'),
    StateModel(33, 'Delhi'),
    StateModel(34, 'Lakshadweep'),
    StateModel(35, 'Puducherry'),
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
                // print('item name: ${item.stateName}');
                // print('query name: $query');
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
              int i;
              bool ch = false;
              bool s = false;
              try{
                //print(state[0].stateName);
                for(i = 0; i < state.length; i++){
                  ch = state[i].stateName == _txtFieldController.text;
                  if(ch == true){
                    print('true');
                    enteredValue = '';
                    newValue = '';
                    print('old value: ${_txtFieldController.text}');
                    s = true;
                    //break;
                  }
                }

                if(s == false && i == state.length){
                  print('if new value entered');
                  newValue = enteredValue;
                  state.add(StateModel(state.last.id + 1, newValue));
                  newState.add(newValue);
                  print(newState);
                  print('new value: $newValue');
                }

                // for (var item in state) {
                //   if (item.stateName.contains(_txtFieldController.text)) {
                //     print('if old value entered');
                //     enteredValue = '';
                //     newValue = '';
                //     print('old value: ${_txtFieldController.text}');
                //   }
                //   else{
                //     print('if new value entered');
                //     newValue = enteredValue;
                //     state.add(StateModel(state.last.id + 1, newValue));
                //     newState.add(newValue);
                //     print(newState);
                //     print('new value: $newValue');
                //   }
                // }
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
