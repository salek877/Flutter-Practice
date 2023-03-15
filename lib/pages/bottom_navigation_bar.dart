import 'package:assignmenta/pages/tabbar.dart';
import 'package:flutter/material.dart';

class BottomNavigatonBar extends StatefulWidget {
  const BottomNavigatonBar({Key? key}) : super(key: key);

  @override
  _BottomNavigatonBarState createState() => _BottomNavigatonBarState();
}

class _BottomNavigatonBarState extends State<BottomNavigatonBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          TabBarScreen(),
          Center(
              child: Text(
            "Search",
            style: TextStyle(fontSize: 32.0),
          )),
          Center(
              child: Text(
            "Profile",
            style: TextStyle(fontSize: 32.0),
          )),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.blue,
        child: TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.black,
          indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 0.0)),
          labelColor: Colors.white,
          labelStyle: TextStyle(fontSize: 12.0),
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.search),
              text: "Search",
            ),
            Tab(
              icon: Icon(Icons.person),
              text: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
