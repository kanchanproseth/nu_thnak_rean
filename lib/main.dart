import 'package:flutter/material.dart';
import './ui/login/LoginScreenWidget.dart';
// import './ui/main/MainScreenWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: LoginScreenWidget()
    );
  }
}
