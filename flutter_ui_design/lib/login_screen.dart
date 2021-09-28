import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => LoginPage();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD2DBE0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  child: Image.asset("assets/logo.png", height: 120, width: 120,),
                  padding: const EdgeInsets.only(top: 100),
                ),
              ]
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    child: Text('LOGIN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),),
                    padding: EdgeInsets.only(top: 30),
                  ),
                ]
            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.47,
                    child: const TextField(
                      textCapitalization: TextCapitalization.words,
                      cursorHeight: 25,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle_outlined, size: 35),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.white),),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.white),),
                      ),
                    ),
                  ),
                ]
            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.47,
                  child: const TextField(
                    cursorHeight: 25,
                    obscureText: true,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outlined, size: 35,),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.white),),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.white),),
                    ),
                  ),
                ),
              ]
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Padding(
                  child: Text('Forgot Password?', style: TextStyle(fontSize: 15),),
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0))
              ]
            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.height * 0.47,
                  child: ElevatedButton(
                    child: const Text('LOGIN', style: TextStyle(color: Colors.white, fontSize: 20),),
                    onPressed: (){
                      print('hello');
                    },
                  ),
                ),
              ]
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  child: Text('CREATE NEW? Click here', style: TextStyle(fontSize: 15),),
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0)
                )
              ]
            ),

          ],
        ),
      )

    );
  }
}
