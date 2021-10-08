import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_design/utility.dart';

void main() => MainPage();

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  List<int> _items = [];

  @override
  void initState(){
    _tabController = TabController(length: 3, vsync: this);

    for(int i = 0; i < 10; i++){
      _items.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Tab Bar Navigator', style: appBarStyle,),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Text('Home'.toUpperCase(), style: const TextStyle(fontSize: 30, color: Colors.white)),
          ),
          Center(
            child: Text('Favourite'.toUpperCase(), style: const TextStyle(fontSize: 30, color: Colors.white)),
          ),
          Center(
            child: Text('Profile'.toUpperCase(), style: const TextStyle(fontSize: 30, color: Colors.white)),
          ),
        ],
      ),

      bottomNavigationBar: Material(
        child: TabBar(
          controller: _tabController,
          tabs: const [
            Padding(
              child: Tab(
                  icon: Icon(Icons.home, size: 30),
              ),
              padding: EdgeInsets.all(5)
            ),
            Padding(
              child: Tab(
                  icon: Icon(Icons.favorite)
              ),
              padding: EdgeInsets.all(5)
            ),
            Padding(
              child: Tab(
                  icon: Icon(Icons.person_outlined)
              ),
              padding: EdgeInsets.all(5)
            ),
          ],
        ),
      ),

    );
  }

}
