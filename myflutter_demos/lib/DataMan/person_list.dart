import 'package:flutter/material.dart';
import 'package:myflutter_demos/Constants/colors.dart';
import 'package:myflutter_demos/DataMan/person_model.dart';

void main() => const PersonDetails();

class PersonDetails extends StatefulWidget {
  const PersonDetails({Key? key}) : super(key: key);

  @override
  _PersonDetailsState createState() => _PersonDetailsState();
}

class _PersonDetailsState extends State<PersonDetails> {
  TextEditingController id = TextEditingController();
  TextEditingController unm = TextEditingController();
  TextEditingController eml = TextEditingController();
  List<PersonModel> personDetails = [];

  late int pos;

  bool listVis = false;
  bool emptyListVis = false;
  @override
  void initState(){
    if(personDetails.isEmpty){
      emptyListVis = true;
      listVis = false;
    }
  }

  void _addData() {
    final id = personDetails.length;
    setState(() {
      personDetails.add(PersonModel(id, unm.text, eml.text));
      if(personDetails.isNotEmpty){
        emptyListVis = false;
        listVis = true;
      }
    });
  }

  void _updateData() {
    setState(() {
      personDetails[pos].unm = unm.text;
      personDetails[pos].eml = eml.text;
    });
  }

  void _removeData() {
    setState(() {
      personDetails.removeAt(pos);
      if(personDetails.isEmpty){
        emptyListVis = true;
        listVis = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LIST'),
        leading: const Icon(Icons.format_list_bulleted_outlined),
        actions: [
          GestureDetector(
            onTap: (){
              _addPerson(context);
              //_addData();
            },
            child: const Padding(
              child: Icon(Icons.person_add_outlined),
              padding: EdgeInsets.all(15.0),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Visibility(
              visible: emptyListVis,
              child: const Center(
                child: Text('Empty List', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),),
              ),
            ),

            Visibility(
              visible: listVis,
              child: ListView.builder(
                itemCount: personDetails.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        pos = index;
                        unm.text = personDetails[index].unm;
                        eml.text = personDetails[index].eml;
                        _updatePerson(context);
                      });

                    },
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: MyColors.greenish,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: ListTile(
                        trailing: GestureDetector(
                          onTap: (){
                            pos = index;
                            _removeData();
                          },
                          child: const Icon(Icons.highlight_off_outlined, color: Colors.white, size: 30.0),
                        ),
                        title: Text('USERNAME: ${personDetails[index].unm.toString()}'),
                        subtitle: Text('EMAIL: ${personDetails[index].eml.toString()}'),
                      ),
                    ),
                  );
                },
              ),
            ),


          ],
        ),
      ),

    );
  }

  _addPerson(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update Details: '),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: unm,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'USERNAME',
                  ),
                ),
                TextFormField(
                  controller: eml,
                  decoration: const InputDecoration(
                    labelText: 'EMAIL',
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10.0)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _addData();
                        unm.text = '';
                        eml.text = '';
                      },
                      child: const Text('ADD'),
                    ),

                    const Padding(padding: EdgeInsets.all(10.0)),

                    ElevatedButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                )

              ],
            ),
          );
        }
    );
  }

  _updatePerson(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update Details: '),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: unm,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'USERNAME',
                  ),
                ),
                TextFormField(
                  controller: eml,
                  decoration: const InputDecoration(
                    labelText: 'EMAIL',
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10.0)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _updateData();
                        Navigator.of(context).pop();
                      },
                      child: const Text('UPDATE'),
                    ),

                    const Padding(padding: EdgeInsets.all(10.0)),

                    ElevatedButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                )

              ],
            ),
          );
        }
    );
  }

}
