import 'package:flutter/material.dart';
import './ui/main/MainScreenWidget.dart';
import './ui/splash_screen/MySplashScreenState.dart';
import './ui/timeline/timeline_screen.dart';
import './resources/post_api_provider.dart';
import './resources/my_class_api_provider.dart';
import './ui/timeline/my_activities/my_posts_list.dart';
import './resources/user_api_provider.dart';
import './ui/timeline/my_activities/class_member_list.dart';
import './ui/timeline/my_activities/add_class_member.dart';
import './ui/timeline/post_detail.dart';
import './resources/comment_api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './ui/widgets/loading_indicator.dart';
import './ui/empty_state/empty_state_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myClasses = MyClassApiProvider.fetchMyClassList(context);
    final posts = PostApiProvider.fetchPostList(context);
    return MaterialApp(
        title: "NU Class Room",
        theme: Theme.of(context).copyWith(
            accentIconTheme:
                Theme.of(context).accentIconTheme.copyWith(color: Colors.white),
            accentColor: Colors.amber,
            primaryColor: Colors.amber,
            primaryIconTheme: Theme.of(context)
                .primaryIconTheme
                .copyWith(color: Colors.white),
            primaryTextTheme: Theme.of(context)
                .primaryTextTheme
                .apply(bodyColor: Colors.white)),
        onGenerateRoute: routes,
        home: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 244, 244, 244),
            ),
            child: FutureBuilder<bool>(
              future: _checkLogin(), // async work
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return LoadingIndicator();
                  default:
                    if (snapshot.hasError)
                      return EmptyStateWidget(title: "Something went wrong");
                    else if (snapshot.data == true)
                      return MainScreenWidget();
                    else
                      return MySplashScreen();
                }
              },
            )));
  }

  Future<bool> _checkLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var checkValue = sharedPreferences.getBool("check");
    print(checkValue);
    if (checkValue == null) {
      sharedPreferences.setBool('check', false);
    }
    return sharedPreferences.getBool("check");
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
        final augs = settings.arguments;
        var id = augs as String;

        final myClass = MyClassApiProvider.fetchMyClassById(context, id);
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
            final myClass = MyClassApiProvider.fetchMyClassById(context, '1');
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
