import 'package:flutter/material.dart';
import './ui/login/LoginScreenWidget.dart';
import './ui/main/MainScreenWidget.dart';
import './ui/splash_screen/MySplashScreenState.dart';
import './ui/create_class/CreateClass.dart';
import './ui/timeline/timeline_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "NU Tnak Rean",
      onGenerateRoute: routes,
      home: LoginScreenWidget()
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
          return TimelineScreen();
        });
      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return MainScreenWidget();
        });
    }
  }
}
