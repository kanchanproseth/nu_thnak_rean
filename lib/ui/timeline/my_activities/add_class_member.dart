import 'package:flutter/material.dart';
import '../../../models/user_model.dart';
import '../../../models/my_class_model.dart';
import '../widgets/add_member_list_tile.dart';

class AddClassMember extends StatelessWidget {
  final Future<List<UserModel>> members;
  final Future<MyClassModel> myClass;

  AddClassMember({this.members, this.myClass});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Member"),
      ),
      body: Container(
        color: Colors.white,
        child: _buildMemberList(),
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 237, 237, 237),
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          border: new OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent),
            borderRadius: new BorderRadius.circular(20),
          ),
          hintText: "Search People or Phone",
        ),
      ),
    );
  }

  Widget _buildMemberList() {
    return FutureBuilder(future: Future(() async {
      return await members;
    }), builder:
        (BuildContext context, AsyncSnapshot<List<UserModel>> members) {
      if (members.data == null) {
        return Text("Loading....");
      }
      return ListView.builder(
        itemCount: members.data == null ? 1 : members.data.length + 1,
        itemBuilder: (BuildContext context, int index) =>
            _itemBuilder(context, index, members.data),
      );
    });
  }

  Widget _itemBuilder(
      BuildContext context, int index, List<UserModel> members) {
    if (index == 0)
      return Column(
        children: <Widget>[
          _buildSearchBox(),
          Divider(
            height: 0.8,
          ),
        ],
      );
    index -= 1;
    // final c = await myClass;
    return AddMemberListTile(member: members[index], myClass: myClass,);
  }
}
