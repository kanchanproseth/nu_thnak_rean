import 'package:flutter/material.dart';
import '../../models/post_model.dart';
import './post_item.dart';

class PostList extends StatelessWidget {
  final Future<List<PostModel>> posts;

  PostList({this.posts});

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
        return ListView.builder(
          itemCount: posts.data.length,
          itemBuilder: (BuildContext context, int index) =>
              _itemBuilder(context, index, posts.data[index]),
        );
      }),
    );
  }

  Widget _itemBuilder(BuildContext context, int index, PostModel post) {
    return PostItem(post: post);
  }
}
