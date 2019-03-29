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
      title: "NU Tnak Rean",
      onGenerateRoute: routes,
      home: LoginScreenWidget()
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (BuildContext context) {
        return MainScreenWidget();
      });
    } else if (settings.name.contains('/timeline')) {
      return MaterialPageRoute(builder: (BuildContext context) {
        final posts = PostApiProvider.fetchMyClassList(context);
        final myClassId =
            int.parse(settings.name.replaceFirst("/timeline/", ""));
        final myClass = MyClassApiProvider.fetchMyClassById(context, myClassId);
        return TimelineScreen(
          posts: posts,
          myClass: myClass,
        );
      });
    }
    return MaterialPageRoute(builder: (BuildContext context) {
      return MainScreenWidget();
    });
  }
}
