import 'package:flutter/material.dart';
import '../../models/post_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostItem extends StatelessWidget {
  final PostModel post;

  PostItem({this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          if (post.postType.contains("Question")) {
            Navigator.pushNamed(context, "/question/${post.id}");
            return;
          }
          Navigator.pushNamed(context, "/post_detail/${post.id}");
        },
        child: Column(
          children: <Widget>[
            _buildHeader(),
            Text(post.content),
            post.postType == 'Announcement' ? Text('') : _buildPostType(context),
            _buildStatistic(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          _buildProfile(),
          Spacer(flex: 1),
          Text(
            post.status,
            style: TextStyle(
              color: post.status == 'Expired' ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfile() {
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

  Widget _buildPostType(BuildContext context) {
    var btnTitle = '';
    var icon = post.postType.contains('File')
        ? Icon(FontAwesomeIcons.fileArchive, color: Colors.deepOrangeAccent)
        : Icon(FontAwesomeIcons.book, color: Colors.grey);
    if (post.postType.contains('File') || post.postType.contains('Assigment')) {
      btnTitle = 'Download';
    } else {
      btnTitle = 'Answer';
      icon = Icon(FontAwesomeIcons.solidQuestionCircle, color: Colors.blue);
    }

    var postType = post.postType.contains('Question')
        ? post.question
        : post.postType;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: icon,
              ),
              Text("$postType")
            ],
          ),
          Spacer(flex: 1),
          SizedBox(
            height: 20,
            width: 120,
            child: FlatButton(
              child: Text(
                btnTitle,
                style: TextStyle(fontSize: 11),
              ),
              textColor: Colors.white,
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                if (post.postType.contains("Question")) {
                  Navigator.pushNamed(context, "/answer/${post.id}");
                  return;
                }
                Navigator.pushNamed(context, "/post_detail/${post.id}");
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatistic() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        post.numberOfComments > 0
            ? Text(
                "${post.numberOfComments} Comments",
                style: TextStyle(fontSize: 10),
              )
            : Text(''),
        post.numberOfAnswers > 0
            ? Text(
                "  ${post.numberOfAnswers} Answers",
                style: TextStyle(fontSize: 10),
              )
            : Text(''),
        post.numberOfDownloads > 0
            ? Text(
                "  ${post.numberOfDownloads} Downloads",
                style: TextStyle(fontSize: 10),
              )
            : Text(''),
      ],
    );
  }
}
