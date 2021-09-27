import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future <List<Data>> fetchData() async {
  final Uri uri = Uri.parse('https://gorest.co.in/public/v1/users');
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    //List jsonResponse = json.decode(response.body);
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> jsonResponse = map["data"];
    return jsonResponse.map((data) => Data.fromJson(data)).toList();

    // print(data[0]["name"]);
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class Data {
  final int id;
  final String name;
  final String email;
  final String gender;
  final String status;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      status: json['status'],
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future <List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter app',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Http GET Request'),
        ),
        body: Center(
          child: FutureBuilder <List<Data>>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data>? data = snapshot.data;
                return
                  ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text('         Name : ${snapshot.data![index].name}'),
                      subtitle: Text('          Email Id: ${snapshot.data![index].email}'),
                  ),
                  );
              }
              else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

