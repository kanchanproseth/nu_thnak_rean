import 'package:flutter/material.dart';
import '../../../models/user_model.dart';

class MemberListTile extends StatelessWidget {
  final UserModel member;

  MemberListTile({this.member});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  width: 25,
                  height: 25,
                ),
                Text(member.name),
                Spacer(flex: 1),
                member.occupation.contains("Instructor")
                    ? Text(member.occupation, style: TextStyle(
                      fontSize: 10
                    ),)
                    : Spacer(flex: 1)
              ],
            ),
          ),
          Divider(
            height: 0.8,
          )
        ],
      ),
    );
  }
}
