import 'package:flutter/material.dart';
import '../../../models/user_model.dart';
import '../../../models/my_class_model.dart';

class AddMemberListTile extends StatelessWidget {
  final UserModel member;
  final Future<MyClassModel> myClass;

  AddMemberListTile({this.member, this.myClass});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: Future(() async {
      return await myClass;
    }), builder: (BuildContext context, AsyncSnapshot<MyClassModel> myClass) {
      if (myClass.data == null) return Text('Loading...');
      return _buildTile(myClass.data);
    });
  }

  Widget _buildTile(MyClassModel myClass) {
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
                      borderRadius: BorderRadius.circular(15)),
                  width: 25,
                  height: 25,
                ),
                Text(member.name),
                Spacer(flex: 1),
                member.myClassIds.contains(myClass.id)
                    ? Text(
                        'Added',
                        style: TextStyle(fontSize: 10),
                      )
                    : GestureDetector(
                        child: Text(
                          'Add',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.blue,
                          ),
                        ),
                        onTap: () {},
                      )
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
