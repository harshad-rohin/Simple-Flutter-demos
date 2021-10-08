import 'package:flutter/material.dart';
import 'package:progressive_image/progressive_image.dart';
import '../Constants/colors.dart';

class ShowBirdDetail extends StatefulWidget {
  late final String url;
  late final String name;
  late final String desc;
  ShowBirdDetail({required this.url, required this.name, required this.desc});

  @override
  _ShowBirdDetailState createState() => _ShowBirdDetailState();
}

class _ShowBirdDetailState extends State<ShowBirdDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Preview Image'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(right: 10.0, top: 10.0, left: 10.0),
                child: ProgressiveImage(
                  placeholder: AssetImage('assets/images/load.png'),
                  // size: 1.87KB
                  thumbnail: AssetImage('assets/images/load1.png'),
                  // size: 1.29MB
                  image: NetworkImage(widget.url),
                  fit: BoxFit.fill,
                  height: 300,
                  width: 500,
                )
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(widget.name,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  )
              ),

              decoration: BoxDecoration(
                color: MyColors.greenish,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                ),

              ),
              margin: EdgeInsets.only(right: 10.0, left: 10.0),
              width: MediaQuery.of(context).size.width,
              height: 45,
            ),

            Container(
              padding: EdgeInsets.all(15.0),
              child: Text(widget.desc),
              margin: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
