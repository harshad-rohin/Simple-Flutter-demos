import 'package:flutter/material.dart';
import 'package:progressive_image/progressive_image.dart';

import '../Bird_preview.dart';
import 'BirdsDataModelForList.dart';

void main() => LListView();

class LListView extends StatefulWidget {
  const LListView({Key? key}) : super(key: key);

  @override
  _LListViewState createState() => _LListViewState();
}

class _LListViewState extends State<LListView> {
  List<BirdsData> items = [
    BirdsData(
      id : 0,
      name : "Peacock",
      imageURL : 'https://images.pexels.com/photos/4475253/pexels-photo-4475253.jpeg',
      description : "Peacocks are a type of large pheasant known for their beautiful colored feathers. Their tail feathers, also called coverts, make up more than 60 percent of the birds total body length, with only males having the colorful blue and green iridescent feathers."
    ),
    BirdsData(
      id : 1,
      name : "Duck",
      imageURL : 'https://images.pexels.com/photos/7025579/pexels-photo-7025579.jpeg',
      description : "The stereotypical “duck” has a torpedo shaped body, rounded head, and a slightly flattened and rounded bill. Some species are quite small, while others are larger, but they are smaller than geese and swans."
    ),
    BirdsData(
      id : 2,
      name : "Hen",
      imageURL : 'https://images.pexels.com/photos/1405930/pexels-photo-1405930.jpeg',
      description : "A hen is a female chicken. People often keep hens in order to eat them or sell their eggs. The female of any bird can be referred to as a hen."
    ),
    BirdsData(
      id : 3,
      name : "Cock",
      imageURL : 'https://images.pexels.com/photos/1769271/pexels-photo-1769271.jpeg',
      description : "Rooster or cock is a term for an adult male bird, and younger male may be called a cockerel. A male that has been castrated is a capon. ... There are more chickens in the world than any other bird."
    ),
    BirdsData(
      id : 4,
      name : "Swan",
      imageURL : 'https://images.pexels.com/photos/8224249/pexels-photo-8224249.jpeg',
      description : "Swans are gracefully long-necked, heavy-bodied, big-footed birds that glide majestically when swimming and fly with slow wingbeats and with necks outstretched.\n"
    ),

    BirdsData(
      id : 5,
      name : "Parrot",
      imageURL : 'https://images.pexels.com/photos/1661179/pexels-photo-1661179.jpeg',
      description : "Parrots are birds of the order Psittaciformes. ... Parrots are intelligent birds. They have relatively large brains, they can learn, and they can use simple tools. Because some species have the ability to make sounds like human voices and have plumages with bright colors, many species are kept as pets."
    ),
    BirdsData(
      id : 6,
      name : "Cuckoo",
      imageURL : 'https://images.pexels.com/photos/7025579/pexels-photo-7025579.jpeg',
      description : "a largely grayish-brown European bird (Cuculus canorus) that is a parasite given to laying its eggs in the nests of other birds which hatch them and rear the offspring broadly : any of a large family (Cuculidae of the order Cuculiformes) to which this bird belongs."
    ),
    BirdsData(
      id : 7,
      name : "Sparrow",
      imageURL : 'https://images.pexels.com/photos/326900/pexels-photo-326900.jpeg',
      description : "A sparrow is a member of the genus Passer. They are small passerine birds which belong to the family Passeridae. They are also known as old-world sparrows. Sparrows often make their nests near houses or buildings. This means they are one of the easiest birds to see in the wild."
    ),
    BirdsData(
      id : 8,
      name : "Crow",
      imageURL : 'https://images.pexels.com/photos/802255/pexels-photo-802255.jpeg',
      description : "Crows are black birds known for their intelligence and adaptability, and for their loud, harsh \"caw.\""
    ),
    BirdsData(
      id : 9,
      name : "Eagle",
      imageURL : 'https://images.pexels.com/photos/632452/pexels-photo-632452.jpeg',
      description : "Eagles are large, powerful Birds of Prey. ... An Eagle may resemble a Vulture in build and flight characteristics but has a fully feathered (often crested) head and strong feet equipped with great curved talons."
    )

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.flutter_dash_outlined),
        title: Text('Birds List'),
      ),
      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index){
            return SizedBox(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  String url = items[index].imageURL.toString();
                  String name = items[index].name.toString();
                  String desc = items[index].description.toString();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowBirdDetail(url : url, name : name, desc : desc)),
                  );
                  print(items[index].name.toString());
                },
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: ProgressiveImage(
                            placeholder: AssetImage('assets/images/load.png'),
                            // size: 1.87KB
                            thumbnail: AssetImage('assets/images/load1.png'),
                            // size: 1.29MB
                            image: NetworkImage(items[index].imageURL.toString()), fit: BoxFit.fill,
                            height: 300,
                            width: 500,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    items[index].name.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                )
              ),
            );
          }
        ),
      )
    );
  }

}
