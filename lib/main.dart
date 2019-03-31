import 'package:flutter/material.dart';
import './ui/login/LoginScreenWidget.dart';
import './ui/main/MainScreenWidget.dart';
import './ui/splash_screen/MySplashScreenState.dart';
import './ui/create_class/CreateClass.dart';
import './ui/timeline/timeline_screen.dart';
import './resources/post_api_provider.dart';
import './resources/my_class_api_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (BuildContext context) {
        return MainScreenWidget();
      });
    } else if (settings.name.contains('/timeline')) {
      return MaterialPageRoute(builder: (BuildContext context) {
        final posts = PostApiProvider.fetchMyClassList(context);
        final classworks =
            PostApiProvider.fetchMyClassListByType(context, 'File');
        final assignments =
            PostApiProvider.fetchMyClassListByType(context, 'Assigment');
        final questions =
            PostApiProvider.fetchMyClassListByType(context, 'Question');
        final announcements =
            PostApiProvider.fetchMyClassListByType(context, 'Announcement');
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
    }
    return MaterialPageRoute(builder: (BuildContext context) {
      return MainScreenWidget();
    });
  }
}
