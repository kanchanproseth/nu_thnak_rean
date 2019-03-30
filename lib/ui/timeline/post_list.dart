import 'package:flutter/material.dart';
import '../../models/post_model.dart';
import './post_item.dart';
import '../../models/my_class_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostList extends StatelessWidget {
  final Future<List<PostModel>> posts;
  final Future<MyClassModel> myClass;
  final bool shouldShowPostCreationInput;

  PostList(
      {this.posts, this.myClass, this.shouldShowPostCreationInput = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 244, 244, 244),
      ),
      child: FutureBuilder(future: Future(() async {
        final data = await posts;
        return data;
      }), builder:
          (BuildContext context, AsyncSnapshot<List<PostModel>> posts) {
        if (posts.data == null) {
          return Text("Loading....");
        }
        return ListView.builder(
          itemCount: posts.data == null ? 1 : posts.data.length + 1,
          itemBuilder: (BuildContext context, int index) =>
              _itemBuilder(context, index, posts.data),
        );
      }),
    );
  }

  Widget _itemBuilder(BuildContext context, int index, List<PostModel> posts) {
    if (index == 0) return _headerBuilder();
    index -= 1;
    return PostItem(post: posts[index]);
  }

  Widget _headerBuilder() {
    return Column(
      children: <Widget>[
        _buildClass(),
        _buildPostCreationInput(),
      ],
    );
  }

  Widget _buildClass() {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        bottom: 60,
        left: 10,
        right: 10,
      ),
      color: Colors.purple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitleAndSub(),
          _buildSetting(),
        ],
      ),
    );
  }

  Widget _buildPostCreationInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 0.5),
      color: Colors.white,
      child: !shouldShowPostCreationInput
          ? Row()
          : Row(
              children: <Widget>[
                Container(
                  height: 20,
                  width: 20,
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
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: TextField(
                      maxLines: null,
                      maxLengthEnforced: false,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Post something to your class",
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildTitleAndSub() {
    return FutureBuilder(future: Future(() async {
      final data = await myClass;
      return data;
    }), builder: (BuildContext context, AsyncSnapshot<MyClassModel> myClass) {
      if (myClass.data == null) {
        return Text('Loading...');
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            myClass.data.name,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text(
                    myClass.data.section,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ),
                Text(
                  '${myClass.data.member} Member',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ],
            ),
          )
        ],
      );
    });
  }

  Widget _buildSetting() {
    return GestureDetector(
      onTap: () {},
      child: Icon(
        Icons.settings,
        color: Colors.white,
      ),
    );
  }
}
