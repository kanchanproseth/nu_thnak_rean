import 'package:flutter/material.dart';
import '../../../models/post_model.dart';
import '../../widgets/loading_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuestionReplyList extends StatelessWidget {
  final Future<List<PostModel>> members;

  QuestionReplyList({this.members});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Member Replied"),
      ),
      body: Container(
        color: Color.fromARGB(255, 244, 244, 244),
        child: FutureBuilder(future: Future(() async {
          final data = await members;
          return data;
        }), builder:
            (BuildContext context, AsyncSnapshot<List<PostModel>> members) {
          if (members.data == null) return LoadingIndicator();
          return ListView.builder(
            itemCount: members.data.length,
            itemBuilder: (BuildContext context, int index) =>
                _itemBuilder(context, index, members.data[index]),
          );
        }),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index, PostModel member) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: ListTile(
        leading: Container(
          height: 25,
          width: 25,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey,
          ),
          child: Icon(
            FontAwesomeIcons.userAlt,
            size: 10,
          ),
        ),
        title: Text(member.by),
        subtitle: Text(member.createdAt),
        onTap: () {
          Navigator.pushNamed(context, '/member_answer/${member.by}');
        },
      ),
    );
  }
}
