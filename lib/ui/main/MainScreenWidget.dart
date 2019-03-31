import 'package:flutter/material.dart';
import '../drawer/MyDrawer.dart';
import '../buttom_tab_bar/MainButtomBarWidget.dart';
import '../my_class/my_class_list_screen.dart';
import '../../models/my_class_model.dart';
<<<<<<< HEAD
import '../create_class/CreateClass.dart';
import '../new_notification/NewNotification.dart';
import 'package:firebase_database/firebase_database.dart';
=======
import '../../models/post_model.dart';
import '../widgets/loading_indicator.dart';
import '../new_feeds/new_feed_list.dart';
>>>>>>> 9c127cd6e9e849477d03f8476cb2e7109c11de9c

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
<<<<<<< HEAD
  DatabaseReference itemRef;
  MyClassModel _myClass;

  List<MyClassModel> myClasses;
  void initMyClassData() async {
    //mock
    // myClasses = await MyClassApiProvider.fetchMyClassList(context);
    // final FirebaseDatabase database = FirebaseDatabase.instance;
    // itemRef = database.reference().child('my_classes');
    // for (_myClass in myClasses){
    //   itemRef.push().set(_myClass.toJson());
    // }
    
  }

  void createClass(){
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateClass(title: "Create class",)),
    );
  }

  void joinClass(){
    
  }
=======
  int currentIndex = 0;
  final List<String> titles = ["New Feeds", "My Class", "Notification"];
>>>>>>> 9c127cd6e9e849477d03f8476cb2e7109c11de9c

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 3);
  }

  void onIconsDarkMenuPressed(BuildContext context) {}

  void onShapePressed(BuildContext context) {
    showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.add_circle),
            title: Text('Create Class'),
            onTap: () => this.createClass(),          
          ),
          ListTile(
            leading: Icon(Icons.insert_link),
            title: Text('Join Class'),
            onTap: () => this.joinClass(),        
          ),
        ],
      );
    });
  }

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
          ),
          drawer: MyDrawer(),
          body: TabBarView(
            controller: tabController,
            children: [
              _buildNewFeedsTab(),
              _buildMyClassTab(),
              Container(
                child: NewNotification(),
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
      Future.delayed(Duration(seconds: 3), () {});
      return await widget.myClasses;
    }), builder:
        (BuildContext context, AsyncSnapshot<List<MyClassModel>> myClasses) {
      if (myClasses.data == null) return LoadingIndicator();
      return Container(
        child: MyClassListScreen(),
      );
    });
  }

  Widget _buildNewFeedsTab() {
    return Container(
      child: NewFeedList(posts: widget.posts),
    );
  }
}
