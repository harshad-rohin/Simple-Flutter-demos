import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myflutter_demos/AlertNotifier/returning_container_design.dart';
import 'data_modal.dart';

class AlertSlider extends StatefulWidget {
  const AlertSlider({Key? key}) : super(key: key);

  @override
  _AlertSliderState createState() => _AlertSliderState();
}

class _AlertSliderState extends State<AlertSlider> {
  late Future <List<DataModal>> futureData;
  Future <List<DataModal>> fetchData() async {
    final Uri uri = Uri.parse('http://10.0.2.2:3000/users');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return dataFromJson(response.body);
    }
    else {
      throw Exception('Unexpected error occurred !');
    }
  }

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text('Alert Slider'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    height: 300.0,
                    width: 300.0,
                    color: Colors.green[200],
                  ),
                ),

                Center(
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    height: 300.0,
                    width: 300.0,
                    color: Colors.green[200],
                  ),
                ),

                Center(
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    height: 300.0,
                    width: 300.0,
                    color: Colors.green[200],
                  ),
                ),

                Center(
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    height: 300.0,
                    width: 300.0,
                    color: Colors.green[200],
                  ),
                ),
              ],
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FutureBuilder<List<DataModal>>(
                    future: futureData,
                    builder: (context, snapshot){
                      if (snapshot.hasData) {
                        List<DataModal>? data = snapshot.data;
                        /// https://pub.dev/packages/carousel_slider
                        return CarouselSlider.builder(
                          itemCount: data!.length,
                          options: carouselOptions,
                          itemBuilder: (context, index, realIndex) {
                            return alertContainer(context, snapshot.data![index].username);
                          },
                        );
                      }
                      else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return Container();
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
