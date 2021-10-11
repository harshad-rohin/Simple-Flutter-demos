//https://pub.dev/packages/decimal

import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Constants/colors.dart';

void main() => const SaleProductForm();

class SaleProductForm extends StatefulWidget {
  const SaleProductForm({Key? key}) : super(key: key);

  @override
  _SaleProductFormState createState() => _SaleProductFormState();
}

class _SaleProductFormState extends State<SaleProductForm> {
  bool roundOff = false;
  TextEditingController partyName = TextEditingController();
  TextEditingController partyCont = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController productAmt = TextEditingController();
  TextEditingController productDis = TextEditingController();
  TextEditingController rOffAmt = TextEditingController();
  TextEditingController totalAmt = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late AlertDialog dialog;

  void validate(){
    if(_formKey.currentState!.validate()){
      print('Total Amount: ${Decimal.parse(productAmt.value.text) - Decimal.parse(productDis.value.text)}');
      showDialog<void>(context: context, builder: (context) => dialog);
      print('validated');
    }
    else{
      print('not validated');
    }
  }

  String? validation(value){
    if(value!.isEmpty){
      return "required";
    }
    else{
      return null;
    }
  }



  @override
  Widget build(BuildContext context) {
    dialog = AlertDialog(
      title: Text('Title'),
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Padding(
            child: Text('Party Name is: '),
            padding: EdgeInsets.all(10.0)
          ),

          Padding(
              child: Text('Contact is: '),
              padding: EdgeInsets.all(10.0)
          ),

        ],
      ),
      actions: [
        Center(
          child: FlatButton(
            color: MyColors.greenish,
            onPressed: () => Navigator.pop(context),
            child: Text('CLOSE'),
          ),
        )

      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Please Enter Correct Details'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),

                child: Column(
                  children: [
                    Container(
                      child: SizedBox(
                        child: TextFormField(
                          controller: partyName,
                          decoration: const InputDecoration(
                            hintText: 'Enter Name',
                            labelText: 'Party Name',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                            ),
                          ),
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Container(
                          width: 60.0,
                          child: SizedBox(
                            child: TextFormField(
                              //enabled: false,
                              readOnly: true,
                              decoration: const InputDecoration(
                                hintText: ' +91 ',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                                ),
                              ),
                            ),
                          ),
                        ),

                        const Padding(padding: EdgeInsets.all(6.0)),

                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: SizedBox(
                              child: TextFormField(
                                maxLength: 10,
                                validator: (value){
                                  if(value!.length > 0 && value.length < 10){
                                    return "Invalid Contact no.";
                                  }
                                  else{
                                    return null;
                                  }
                                },
                                controller: partyCont,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'Enter Contact No.',
                                  labelText: 'Contact No.',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )

                      ],
                    ),

                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),

                child: Column(
                  children: [
                    Container(
                      child: SizedBox(
                        child: TextFormField(
                          // validation
                          validator: validation,
                          controller: productName,
                          decoration: const InputDecoration(
                            hintText: 'Enter Product',
                            labelText: 'Product Name',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(padding: const EdgeInsets.all(6.0)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150.0,
                          child: SizedBox(
                            child: TextFormField(
                              // validation
                              validator: validation,
                              controller: productAmt,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: '0.00',
                                labelText: 'Product Amount',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                                ),
                              ),
                            ),
                          ),
                        ),

                        const Padding(padding: EdgeInsets.all(20.0)),

                        Container(
                          width: 150.0,
                          child: SizedBox(
                            child: TextFormField(
                              controller: productDis,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: '0.00',
                                labelText: 'Discount',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFFD2DBE0), width: 3.0)
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),

              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          validate();
                        });
                      },
                      child: const Padding(
                        child: Text('Calculate Total Amount'),
                        padding: EdgeInsets.all(15.0),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
