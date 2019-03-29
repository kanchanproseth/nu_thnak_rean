import 'package:flutter/material.dart';
import '../drawer/MyDrawer.dart';
import '../buttom_tab_bar/MainButtomBarWidget.dart';
import '../my_class/my_class_list_screen.dart';
import '../../resources/my_class_api_provider.dart';
import '../../models/my_class_model.dart';

class MainScreenWidget extends StatefulWidget {
  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget>
    with SingleTickerProviderStateMixin {
  var tabController;

  List<MyClassModel> myClasses;
  void initMyClassData() async {
    myClasses = await MyClassApiProvider.fetchMyClassList(context);
  }

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 3);
    initMyClassData();
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
    return Scaffold(
      body: DefaultTabController(
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
                child: MyClassListScreen(
                  myClasses: myClasses,
                ),
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
