import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/my_class_model.dart';
import 'package:firebase_database/firebase_database.dart';

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

  void deleteClass(MyClassModel myClass) async {
    final FirebaseDatabase database = FirebaseDatabase.instance;
    var myClassref = database.reference().child('my_classes');
    await myClassref.child(myClass.id).remove().then((_) {
      print('Transaction  committed.');
    });
  }

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
        Navigator.pushNamed(context, "/timeline/${item.name}");
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
      item.member == null
      ? "${item.section}   0 member(s)"
      : "${item.section}   ${item.member.length} member(s)",
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
            deleteClass(item);
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
