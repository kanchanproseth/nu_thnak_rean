import 'package:flutter/material.dart';
import '../buttom_tab_bar/timeline_bottom_tab_bar.dart';
import '../../models/post_model.dart';
import './post_list.dart';
import './class_work_list.dart';
import './assigment_list.dart';
import './question_list.dart';
import './announcement_list.dart';
import './class_activity_list.dart';
import '../../models/my_class_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TimelineScreen extends StatefulWidget {
  final Future<List<PostModel>> posts;
  final Future<List<PostModel>> classworks;
  final Future<List<PostModel>> assignments;
  final Future<List<PostModel>> questions;
  final Future<List<PostModel>> announcements;
  final Future<MyClassModel> myClass;
  final List<String> titles = [
    'Timeline',
    'Classwork',
    'Assigment',
    'Question Exam',
    'Announcement',
    'Activities'
  ];

  TimelineScreen(
      {this.posts,
      this.myClass,
      this.classworks,
      this.assignments,
      this.questions,
      this.announcements});

  @override
  _TimelineScreenState createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  var _widgetOptions;

  void onShapePressed(BuildContext context) {
     showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(FontAwesomeIcons.solidQuestionCircle),
            title: Text('Assignment'),
            onTap: () {
              Navigator.pushNamed(context, "/assignment_upload");
            },          
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidQuestionCircle),
            title: Text('Question or Exam'),
            // onTap: () => this.joinClass(),        
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.fileExport),
            title: Text('File'),
            // onTap: () => this.createClass(),          
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.bullhorn),
            title: Text('Announcement'),
            // onTap: () => this.joinClass(),        
          ),
        ],
      );
    });
  }

  void selectedTab(int position) {
    setState(() {
      currentIndex = position;
    });
  }

  initData() {
    _widgetOptions = [
      Container(
        color: Colors.grey,
        child: PostList(
          posts: widget.posts,
          myClass: widget.myClass,
          shouldShowPostCreationInput: true,
        ),
      ),
      Container(
        color: Colors.grey,
        child: ClassworkList(
          posts: widget.classworks,
          myClass: widget.myClass,
        ),
      ),
      Container(
        color: Colors.grey,
        child: AssignmentList(
          posts: widget.assignments,
          myClass: widget.myClass,
        ),
      ),
      Container(
        color: Colors.grey,
        child: QuestionList(
          posts: widget.questions,
          myClass: widget.myClass,
        ),
      ),
      Container(
        color: Colors.grey,
        child: AnnouncementList(
          posts: widget.announcements,
          myClass: widget.myClass,
        ),
      ),
      ClassActivityList(),
    ];
  }

  @override
  void initState() {
    super.initState();

    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            brightness: Brightness.dark,
            title: Text(widget.titles[currentIndex]),
            actions: [
              IconButton(
                onPressed: () => this.onShapePressed(context),
                icon: Icon(Icons.file_download),
              ),
            ],
            backgroundColor: Colors.amber,
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
