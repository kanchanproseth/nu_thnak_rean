import 'package:flutter/material.dart';
import './ui/login/LoginScreenWidget.dart';
import './ui/main/MainScreenWidget.dart';
import './ui/splash_screen/MySplashScreenState.dart';
import './ui/create_class/CreateClass.dart';
import './ui/timeline/timeline_screen.dart';
import './resources/post_api_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NU Tnak Rean",
      onGenerateRoute: routes,
    );
  }

  Route routes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (BuildContext context) {
          return MainScreenWidget();
        });
      case '/timeline':
        return MaterialPageRoute(builder: (BuildContext context) {
          final posts = PostApiProvider.fetchMyClassList(context);
          return TimelineScreen(posts: posts,);
        });
      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return MainScreenWidget();
        });
    }
  }
}
