import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

class MainButtomBarWidget extends StatefulWidget {
  Function selectPage;

  MainButtomBarWidget(this.selectPage);

  @override
  _MainButtomBarWidgetState createState() => _MainButtomBarWidgetState();
}

class _MainButtomBarWidgetState extends State<MainButtomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return FancyBottomNavigation(
    tabs: [
        TabData(iconData: FontAwesomeIcons.home, title: "New Feed"),
        TabData(iconData: FontAwesomeIcons.bookReader, title: "My Class"),
        TabData(iconData: Icons.notifications, title: "Notification")
    ], 
    onTabChangedListener: (position) {
        setState(() {
        // currentPage = position;
        widget.selectPage(position);
        });
    },
);
  }
}
