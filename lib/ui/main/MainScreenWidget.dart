import 'package:flutter/material.dart';
import '../drawer/MyDrawer.dart';
import '../buttom_tab_bar/MainButtomBarWidget.dart';
import '../my_class/my_class_list_screen.dart';
import '../../models/my_class_model.dart';
import '../../models/post_model.dart';
import '../widgets/loading_indicator.dart';
import '../new_feeds/new_feed_list.dart';

class MainScreenWidget extends StatefulWidget {
  final Future<List<MyClassModel>> myClasses;
  final Future<List<PostModel>> posts;

  MainScreenWidget({this.myClasses, this.posts});

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget>
    with SingleTickerProviderStateMixin {
  var tabController;
  int currentIndex = 0;
  final List<String> titles = ["New Feeds", "My Class", "Notification"];

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
      currentIndex = position;
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
            title: Text(titles.elementAt(currentIndex)),
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
              _buildNewFeedsTab(),
              _buildMyClassTab(),
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

  Widget _buildMyClassTab() {
    return FutureBuilder(future: Future(() async {
      return await widget.myClasses;
    }), builder:
        (BuildContext context, AsyncSnapshot<List<MyClassModel>> myClasses) {
      if (myClasses.data == null) return LoadingIndicator();
      return Container(
        child: MyClassListScreen(
          myClasses: myClasses.data,
        ),
      );
    });
  }

  Widget _buildNewFeedsTab() {
    return Container(
      child: NewFeedList(posts: widget.posts),
    );
  }
}
