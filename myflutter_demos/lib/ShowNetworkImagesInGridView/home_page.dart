import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter_demos/ShowNetworkImagesInGridView/preview_image.dart';

class GridViewImages extends StatefulWidget {
  const GridViewImages({Key? key}) : super(key: key);

  @override
  _GridViewImagesState createState() => _GridViewImagesState();
}

class _GridViewImagesState extends State<GridViewImages> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.collections_outlined),
        title: Text('Gallery'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        //padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: <String>[
          'https://cdn.pixabay.com/photo/2017/05/08/13/15/bird-2295431__340.jpg',
          'https://cdn.pixabay.com/photo/2018/08/12/16/59/parrot-3601194__340.jpg',
          'https://cdn.pixabay.com/photo/2017/02/07/16/47/kingfisher-2046453__340.jpg',
          'https://cdn.pixabay.com/photo/2017/05/08/13/15/spring-bird-2295434__340.jpg',
          'https://cdn.pixabay.com/photo/2021/08/26/20/53/bird-6577119__340.jpg',
          'https://cdn.pixabay.com/photo/2012/02/24/16/59/swan-16736__340.jpg',
          'https://cdn.pixabay.com/photo/2021/08/16/09/21/seagulls-6549872__340.jpg',
          'https://cdn.pixabay.com/photo/2017/11/30/11/57/barn-owl-2988291__340.jpg',
          'https://cdn.pixabay.com/photo/2016/11/29/05/32/rooster-1867562__340.jpg',
          'https://cdn.pixabay.com/photo/2014/11/28/01/01/jay-548381_960_720.jpg',
        ].map((String url) {
          return GridTile(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PreviewImage()),
                  );
                });
                // final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Column(
                children: [
                  Image.network(url, fit: BoxFit.fill),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Center(
                      child: Text('name', style: TextStyle(fontSize: 20),),
                    )
                  )
                ],
              ),
            ),
          );
        }).toList()
      ),
    );
  }

}
