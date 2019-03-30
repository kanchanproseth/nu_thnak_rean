import 'package:flutter/material.dart';

import './widgets//activity_list_tile.dart';

class ClassActivityList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClassActivityListState();
  }
}

class _ClassActivityListState extends State<ClassActivityList> {
  bool switchValue = true;
  onSwitchValueChange(bool value) {
    setState(() {
      switchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(100, 244, 244, 244),
      child: ListView(
        children: <Widget>[
          _buildPostedSection(),
          _buildStatusSection(),
          _buildMemberSection(),
        ],
      ),
    );
  }

  Widget _buildPostedSection() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10, left: 10),
            child: Text(
              'POSTED',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ActivityListTile(
                  title: 'Assigments',
                ),
                ActivityListTile(
                  title: 'Question Exam',
                ),
                ActivityListTile(
                  title: 'Posted File',
                ),
                ActivityListTile(
                  title: 'Announcement',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStatusSection() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10, left: 10),
            child: Text(
              'STATUS',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ActivityListTile(
                  title: 'Active',
                ),
                ActivityListTile(
                  title: 'Expired',
                ),
                ActivityListTile(
                  title: 'Schedule Posts',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMemberSection() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10, left: 10),
            child: Text(
              'MEMBER',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ActivityListTile(
                  title: 'See Class Member',
                  shouldShowArrow: true,
                ),
                ActivityListTile(
                  title: 'Share Class Code',
                  shouldShowArrow: true,
                ),
                ActivityListTile(
                  title: 'Add Member',
                  shouldShowArrow: true,
                ),
                ActivityListTile(
                  title: 'Enable Join',
                  shouldShowSwitch: true,
                  switchValue: switchValue,
                  onSwitchValueChange: onSwitchValueChange,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
