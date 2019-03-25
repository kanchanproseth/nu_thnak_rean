import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainButtomBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(
          icon: Icon(FontAwesomeIcons.newspaper),
          text: "News Feed",
        ),
        Tab(
          icon: Icon(Icons.library_books),
          text: "My Class",
        ),
        Tab(
          icon: Icon(Icons.notifications),
          text: "Notification",
        ),
      ],
      labelColor: Color.fromARGB(255, 0, 176, 255),
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorPadding: EdgeInsets.all(2.0),
      indicatorColor: Color.fromARGB(255, 0, 176, 255),
    );
  }
}
