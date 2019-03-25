import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../drawer/MyDrawer.dart';
import '../buttom_tab_bar/MainButtomBarWidget.dart';

class MainScreenWidget extends StatelessWidget {
  void onIconsDarkMenuPressed(BuildContext context) {}

  void onShapePressed(BuildContext context) {}

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
          bottomNavigationBar: MainButtomBarWidget(),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
