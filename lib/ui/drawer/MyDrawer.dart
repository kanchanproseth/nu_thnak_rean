import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    return Drawer(
            child: ListView(
              padding: const EdgeInsets.all(0.0),
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("Proseth"),
                  accountEmail: Text("Proseth@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).platform == TargetPlatform.iOS
                            ? Colors.white
                            : Colors.blue,
                    child: Text(
                      "P",
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
                ListTile(
                  title: Text("My Class"),
                  leading: Icon(FontAwesomeIcons.home),
                ),
                ListTile(
                  title: Text("Profile"),
                  leading: Icon(FontAwesomeIcons.user),
                ),
                ListTile(
                  title: Text("Create Class"),
                  leading: Icon(FontAwesomeIcons.plusCircle),
                ),
                ListTile(
                  title: Text("Join Class"),
                  leading: Icon(FontAwesomeIcons.link),
                ),
                ListTile(
                  title: Text("About Us"),
                  leading: Icon(FontAwesomeIcons.fileContract),
                ),
                ListTile(
                  title: Text("Feedback"),
                  leading: Icon(FontAwesomeIcons.starOfLife),
                ),
                ListTile(
                  title: Text("Help"),
                  leading: Icon(Icons.help),
                ),
                ListTile(
                  title: Text("Setting"),
                  leading: Icon(Icons.settings),
                ),
              ],
            ),
          );
  }
}