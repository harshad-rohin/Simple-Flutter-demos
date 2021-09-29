import 'package:flutter/material.dart';

void main() => MainPage();

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState(){
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Text('Home'),
          ),
          Center(
            child: Text('Favourite'),
          ),
          Center(
            child: Text('Profile'),
          ),
        ],
      ),

      bottomNavigationBar: Material(
        child: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.home),),
            Tab(icon: Icon(Icons.favorite),),
            Tab(icon: Icon(Icons.person_outlined),),
          ],
        ),
      ),

    );
  }
}
