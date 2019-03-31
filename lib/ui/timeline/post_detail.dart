import 'package:flutter/material.dart';
import '../../models/post_model.dart';
import '../widgets/loading_indicator.dart';
import '../../models/comment_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostDetail extends StatelessWidget {
  final Future<PostModel> post;
  final Future<List<CommentModel>> comments;

  PostDetail({this.post, this.comments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Detail"),
      ),
      body: _bodyBuilder(),
    );
  }

  Widget _bodyBuilder() {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 1), () => comments),
        builder:
            (BuildContext context, AsyncSnapshot<List<CommentModel>> snapshot) {
          if (snapshot.data == null) return Center(child: LoadingIndicator());
          return ListView.builder(
            itemCount: snapshot.data == null ? 1 : snapshot.data.length + 1,
            itemBuilder: (BuildContext context, int index) =>
                _itemBuilder(context, index, snapshot.data),
          );
        });
  }

  Widget _itemBuilder(
      BuildContext context, int index, List<CommentModel> comments) {
    if (index == 0) return _postBuilder(context);
    index -= 1;
    return _commentListTile(context, index, comments.elementAt(index));
  }

  Widget _commentListTile(
      BuildContext context, int index, CommentModel comment) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      color: Colors.white,
      child: _commenterProfileBuilder(comment),
    );
  }

  Widget _commenterProfileBuilder(CommentModel comment) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 20,
          width: 20,
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey,
          ),
          child: Icon(
            FontAwesomeIcons.userAlt,
            size: 10,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              comment.by,
              style: TextStyle(fontSize: 12),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2, bottom:  8),
              child: Text(
              comment.createdAt,
              style: TextStyle(fontSize: 10),
            ),
            ),
            Text(
              "Posted ${comment.createdAt}",
              style: TextStyle(
                  fontSize: 8, color: Colors.grey),
            )
          ],
        ),
      ],
    );
  }

  Widget _postBuilder(BuildContext context) {
    return FutureBuilder(
        future: post,
        builder: (BuildContext context, AsyncSnapshot<PostModel> snapshot) {
          if (snapshot.data == null) return LoadingIndicator();
          return Container(
            margin: EdgeInsets.only(top: 5),
            // padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                _buildHeader(snapshot.data),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(snapshot.data.content),
                ),
                Container(
                  height: 5,
                  color: Color.fromARGB(255, 244, 244, 244),
                  margin: EdgeInsets.only(top: 15),
                ),
                _buildCommentCreationInput(),
              ],
            ),
          );
        });
  }

  Widget _buildCommentCreationInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        style: TextStyle(fontSize: 10),
        maxLines: null,
        maxLengthEnforced: false,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Add comment",
        ),
      ),
    );
  }

  Widget _buildHeader(PostModel post) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10, left: 10),
        child: _buildProfile(post));
  }

  Widget _buildProfile(PostModel post) {
    return Row(
      children: <Widget>[
        Container(
          height: 30,
          width: 30,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              post.by,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(post.createdAt)
          ],
        ),
      ],
    );
  }
}
