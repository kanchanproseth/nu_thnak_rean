import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TimelineBottomTabBar extends StatelessWidget {
  final int currentIndex;
  final Function selectedTab;
  
  TimelineBottomTabBar({this.currentIndex, this.selectedTab});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            activeIcon: Icon(FontAwesomeIcons.chartLine, color: Colors.blue),
            icon: Icon(FontAwesomeIcons.chartLine, color: Colors.grey),
            title: Text("")),
        BottomNavigationBarItem(
            activeIcon: Icon(FontAwesomeIcons.suitcase, color: Colors.blue),
            icon: Icon(FontAwesomeIcons.suitcase, color: Colors.grey),
            title: Text("")),
        BottomNavigationBarItem(
            activeIcon: Icon(FontAwesomeIcons.book, color: Colors.blue),
            icon: Icon(FontAwesomeIcons.book, color: Colors.grey),
            title: Text("")),
        BottomNavigationBarItem(
            activeIcon:
                Icon(FontAwesomeIcons.solidQuestionCircle, color: Colors.blue),
            icon: Icon(FontAwesomeIcons.solidQuestionCircle, color: Colors.grey),
            title: Text("")),
        BottomNavigationBarItem(
            activeIcon: Icon(FontAwesomeIcons.bullhorn, color: Colors.blue),
            icon: Icon(FontAwesomeIcons.bullhorn, color: Colors.grey),
            title: Text("")),
        BottomNavigationBarItem(
            activeIcon: Icon(FontAwesomeIcons.userCog, color: Colors.blue),
            icon: Icon(FontAwesomeIcons.userCog, color: Colors.grey),
            title: Text(""))
      ],
      currentIndex: currentIndex,
      onTap: (position) {
        selectedTab(position);
      },
    );
  }
}
