import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import "../enter_phone_number/EnterPhoneNumberScreenWidget.dart";

class MySplashScreen extends StatefulWidget {

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}


class _MySplashScreenState extends State<MySplashScreen> {
  List<Slide> slides = new List();

  void navigateToEnterPhoneNumber(){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EnterPhoneNumberScreenWidget()),
  );
  }

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "SCHOOL",
        description: "¥ou don't need actual school anymore, Just an Application",
        pathImage: 'assets/logo.png',
        backgroundColor: Color(0xfff5a623),
      ),
    );
    slides.add(
      new Slide(
        title: "CLASS",
        description: "Now you can have your own class :D",
        pathImage: 'assets/logo.png',
        backgroundColor: Color(0xff203152),
      ),
    );
    slides.add(
      new Slide(
        title: "STUDENT",
        description:
            "With any you student you want",
        pathImage: 'assets/logo.png',
        backgroundColor: Color(0xff9932CC),
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    this.navigateToEnterPhoneNumber();
  }

  void onSkipPress() {
    // Do what you want
    this.navigateToEnterPhoneNumber();
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      onSkipPress: this.onSkipPress,
    );
  }
}