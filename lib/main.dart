import 'package:flutter/material.dart';
import './ui/login/LoginScreenWidget.dart';
import './ui/main/MainScreenWidget.dart';
import './ui/splash_screen/MySplashScreenState.dart';
import './ui/create_class/CreateClass.dart';
import './ui/timeline/timeline_screen.dart';
import './resources/post_api_provider.dart';
import './resources/my_class_api_provider.dart';
import './ui/timeline/my_activities/my_posts_list.dart';
import './resources/user_api_provider.dart';
import './ui/timeline/my_activities/class_member_list.dart';
import './ui/timeline/my_activities/add_class_member.dart';
import './ui/timeline/post_detail.dart';
import './resources/comment_api_provider.dart';
import './models/comment_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myClasses = MyClassApiProvider.fetchMyClassList(context);
    final posts = PostApiProvider.fetchPostList(context);
    return MaterialApp(
        title: "NU Class Room",
        theme: Theme.of(context).copyWith(
      accentIconTheme: Theme.of(context).accentIconTheme.copyWith(
        color: Colors.white
      ),
      accentColor: Colors.amber,
      primaryColor: Colors.amber,
      primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(
        color: Colors.white
      ),
      primaryTextTheme: Theme
          .of(context)
          .primaryTextTheme
          .apply(bodyColor: Colors.white)),
        onGenerateRoute: routes,
        home: MySplashScreen());
  }

  Route routes(RouteSettings settings) {
    if (settings.name.contains('/timeline')) {
      return MaterialPageRoute(builder: (BuildContext context) {
        final posts = PostApiProvider.fetchPostList(context);
        final classworks = PostApiProvider.fetchPostListByType(context, 'File');
        final assignments =
            PostApiProvider.fetchPostListByType(context, 'Assigment');
        final questions =
            PostApiProvider.fetchPostListByType(context, 'Question');
        final announcements =
            PostApiProvider.fetchPostListByType(context, 'Announcement');
        final myClassId =
            int.parse(settings.name.replaceFirst("/timeline/", ""));
        final myClass = MyClassApiProvider.fetchMyClassById(context, myClassId);
        return TimelineScreen(
          posts: posts,
          myClass: myClass,
          classworks: classworks,
          assignments: assignments,
          questions: questions,
          announcements: announcements,
        );
      });
    } else if (settings.name.contains('/activities')) {
      return MaterialPageRoute(builder: (BuildContext context) {
        final filterValue = settings.name.replaceFirst("/activities/", "");
        final posts = PostApiProvider.fetchPostListByUserAndFilter(
            context, 1, filterValue);

        switch (filterValue) {
          case 'See Class Member':
            final members = UserApiProvider.fetchMyClassList(context);
            return ClassMemeberList(members: members);
          case 'Add Member':
            final myClass = MyClassApiProvider.fetchMyClassById(context, 1);
            final members = UserApiProvider.fetchMyClassList(context);
            return AddClassMember(members: members, myClass: myClass);
          default:
        }

        return MyPostsList(
          title: filterValue,
          posts: posts,
        );
      });
    } else if (settings.name.contains("/post_detail")) {
      return MaterialPageRoute(builder: (BuildContext context) {
        final postId =
            int.parse(settings.name.replaceFirst("/post_detail/", ""));
        final comments = CommentApiProvider.fetchCommentList(context);
        final post = PostApiProvider.fetchPostById(context, postId);
        return PostDetail(post: post, comments: comments);
      });
    }
    return MaterialPageRoute(builder: (BuildContext context) {
      final myClasses = MyClassApiProvider.fetchMyClassList(context);
      final posts = PostApiProvider.fetchPostList(context);
      return MainScreenWidget(myClasses: myClasses, posts: posts);
    });
  }
}
