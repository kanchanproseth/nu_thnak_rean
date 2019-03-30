import 'package:flutter/material.dart';
import '../../../models/post_model.dart';
import '../post_item.dart';

class MyPostsList extends StatelessWidget {
final String title;
  final Future<List<PostModel>> posts;

MyPostsList({this.title, this.posts});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
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
          itemCount: posts.data.length,
          itemBuilder: (BuildContext context, int index) =>
              _itemBuilder(context, index, posts.data[index]),
        );
      }),
    ),
    );
  }

    Widget _itemBuilder(BuildContext context, int index, PostModel post) {
    return PostItem(post: post);
  }


}