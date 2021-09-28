import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui_design/utility.dart';

void main() => const HomePage();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('UI DESIGNS', style: appBarStyle,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const Padding(
                    child: Center(
                      child: Text('Container with Text Input Field and border radius, shadows', style: lblTxtStyle),
                    ),
                    padding: EdgeInsets.all(20.0)
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 100,
                        width: MediaQuery.of(context).size.height * 0.47,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          //For Border Radius
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          //For Box shadow
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Center(
                              child: TextField(
                                cursorHeight: 30,
                                style: inpTxtStyle,
                                decoration: InputDecoration.collapsed(
                                  hintText: '',
                                ),
                              )
                          ),
                        )
                    ),
                  ],
                )

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 15.0),
                    height: 100,
                    width: MediaQuery.of(context).size.height * 0.47,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Center(
                        child: Text('Container with border', style: inpTxtStyle,),
                      ),
                    )
                ),
              ],
            ),

            

          ],
        )
      )

    );
  }
}

