import 'package:flutter/material.dart';
import '../drawer/MyDrawer.dart';
import '../buttom_tab_bar/MainButtomBarWidget.dart';

class MainScreenWidget extends StatefulWidget {
  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> with SingleTickerProviderStateMixin {
  var tabController;
  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'LEFT'),
    new Tab(text: 'RIGHT'),
  ];

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 3);
  }

  void onIconsDarkMenuPressed(BuildContext context) {}

  void onShapePressed(BuildContext context) {}

  void selectPage(int position) {
    setState(() {
      tabController.animateTo(position);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            brightness: Brightness.dark,
            title: Text(" Feeds"),
            actions: [
              IconButton(
                onPressed: () => this.onShapePressed(context),
                icon: Icon(Icons.add),
              ),
            ],
            backgroundColor: Color.fromARGB(255, 0, 176, 255),
          ),
          drawer: MyDrawer(),
          body: TabBarView(
            controller: tabController,
            children: [
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.orange,
              ),
              Container(
                color: Colors.lightGreen,
              ),
            ],
          ),
          bottomNavigationBar: MainButtomBarWidget(this.selectPage),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
