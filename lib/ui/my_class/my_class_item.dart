import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/my_class_model.dart';

class MyClassItem extends StatelessWidget {
  final MyClassModel item;
  final List<Color> colors = [
    Colors.purple,
    Colors.blueGrey,
    Colors.redAccent,
    Colors.tealAccent
  ];
  final random = Random();

  MyClassItem({this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        padding: EdgeInsets.all(8.0),
        height: 120,
        // color: Colors.blue,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: colors.elementAt(random.nextInt(3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitleRow(context),
            _buildSectionAndMemberText(),
            Spacer(flex: 1),
            _buildSubjectRow(context),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, "/timeline/${item.id}");
      },
    );
  }

  Future<void> _alert(BuildContext context, String title) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Widget _buildTitleRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(item.name,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            )),
        Spacer(flex: 1),
        GestureDetector(
          onTap: () {
            _alert(context, "Edit");
          },
          child: Icon(
            Icons.edit,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget _buildSectionAndMemberText() {
    return Text(
      "${item.section}   ${item.member} member(s)",
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
    );
  }

  Widget _buildSubjectRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(item.name,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            )),
        Spacer(flex: 1),
        GestureDetector(
          onTap: () {
            _alert(context, "Delete");
          },
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
