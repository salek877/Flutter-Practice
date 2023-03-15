import 'package:assignmenta/pages/dash_board_screen.dart';
import 'package:assignmenta/services/exit_pop_services.dart';
import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              DialogShowService().showExitPop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            "News",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Text(
                "All News",
                style: TextStyle(height: 4),
              ),
              Text("Business", style: TextStyle(height: 4)),
              Text("Politics", style: TextStyle(height: 4)),
              Text("Tech", style: TextStyle(height: 4)),
              Text("Science", style: TextStyle(height: 4)),
              Text("Entertainment", style: TextStyle(height: 4)),
            ],
          ),
        ),
        body: TabBarView(children: [
          DashBoardScreen(),
          Icon(
            Icons.business_center,
            size: 350,
          ),
          Icon(
            Icons.room_preferences_outlined,
            size: 350,
          ),
          Icon(
            Icons.miscellaneous_services,
            size: 350,
          ),
          Icon(
            Icons.science,
            size: 350,
          ),
          Icon(
            Icons.movie,
            size: 350,
          ),
        ]),
      ),
    );
  }
}
