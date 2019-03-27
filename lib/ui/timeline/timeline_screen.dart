import 'package:flutter/material.dart';
import '../buttom_tab_bar/timeline_bottom_tab_bar.dart';

class TimelineScreen extends StatefulWidget {
  @override
  _TimelineScreenState createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen>
    with SingleTickerProviderStateMixin {
  // var tabController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // tabController = new TabController(vsync: this, length: 6);
  }

  void onIconsDarkMenuPressed(BuildContext context) {}

  void onShapePressed(BuildContext context) {}

  void selectedTab(int position) {
    setState(() {
      currentIndex = position;
    });
  }

  final _widgetOptions = [
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.orange,
    ),
    Container(
      color: Colors.lightGreen,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.orange,
    ),
    Container(
      color: Colors.lightGreen,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            brightness: Brightness.dark,
            title: Text(" Timelines"),
            actions: [
              IconButton(
                onPressed: () => this.onShapePressed(context),
                icon: Icon(Icons.file_download),
              ),
            ],
            backgroundColor: Color.fromARGB(255, 0, 176, 255),
          ),
          body: _widgetOptions.elementAt(currentIndex),
          bottomNavigationBar: TimelineBottomTabBar(
              currentIndex: currentIndex, selectedTab: selectedTab),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
