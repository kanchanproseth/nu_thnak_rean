import 'package:flutter/material.dart';
import '../../models/post_model.dart';
import '../timeline/post_item.dart';
import '../widgets/loading_indicator.dart';

class NewFeedList extends StatelessWidget {
  final Future<List<PostModel>> posts;

  NewFeedList(
      {this.posts});

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
        if (posts.data == null) return LoadingIndicator();
        return ListView.builder(
          itemCount: posts.data.length,
          itemBuilder: (BuildContext context, int index) =>
              _itemBuilder(context, index, posts.data),
        );
      }),
    );
  }

  Widget _itemBuilder(BuildContext context, int index, List<PostModel> posts) {
    return PostItem(post: posts[index]);
  }
}
