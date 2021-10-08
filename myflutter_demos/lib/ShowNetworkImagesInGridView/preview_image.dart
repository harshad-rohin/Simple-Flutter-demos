import 'package:flutter/material.dart';
import 'package:myflutter_demos/Constants/colors.dart';

class PreviewImage extends StatefulWidget {
  @override
  _PreviewImageState createState() => _PreviewImageState();
}

class _PreviewImageState extends State<PreviewImage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 10.0, top: 10.0, left: 10.0),
              child: Image.network('https://cdn.pixabay.com/photo/2017/05/08/13/15/bird-2295431__340.jpg', fit: BoxFit.fill),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('name',
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

                // boxShadow: [
                //   BoxShadow(
                //     offset: Offset(0, 2),
                //     blurRadius: 12,
                //   )
                // ]
              ),
              margin: EdgeInsets.only(right: 10.0, left: 10.0),
              width: MediaQuery.of(context).size.width,
              height: 80,
            ),

            Container(
              padding: EdgeInsets.all(15.0),
              child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book'),
              margin: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              height: 200,
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
