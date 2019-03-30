import 'package:flutter/material.dart';
import '../../../models/user_model.dart';
import '../widgets/member_list_tile.dart';

class ClassMemeberList extends StatelessWidget {
  final Future<List<UserModel>> members;

  ClassMemeberList({this.members});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("See Class Member"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.group_add,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 244, 244, 244),
        child: FutureBuilder(future: Future(() async {
          final data = await members;
          return data;
        }), builder:
            (BuildContext context, AsyncSnapshot<List<UserModel>> members) {
          if (members.data == null) {
            return Text("Loading....");
          }
          return ListView.builder(
            itemCount: members.data.length,
            itemBuilder: (BuildContext context, int index) =>
                _itemBuilder(context, index, members.data[index]),
          );
        }),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, index, member) {
    return MemberListTile(member: member);
  }
}
