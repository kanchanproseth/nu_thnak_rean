import '../../models/post_model.dart';
import '../../models/my_class_model.dart';
import './post_list.dart';

class ClassworkList extends PostList {
  final Future<List<PostModel>> posts;
  final Future<MyClassModel> myClass;

  ClassworkList({this.posts, this.myClass}) {
    PostList(
      posts: posts,
      myClass: myClass,
    );
  }
}