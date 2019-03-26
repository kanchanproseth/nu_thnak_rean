import 'package:flutter/material.dart';
import '../enter_phone_number/EnterPhoneNumberScreenWidget.dart';

class LoginScreenWidget extends StatelessWidget {
  void onButtonSignUpPressed(BuildContext context) {}

  void onButtonSignInPressed(BuildContext context) {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EnterPhoneNumberScreenWidget()),
  );
  }

  void onHowToUsePressed(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 100, left: 100, right: 100),
              child: 
              AspectRatio(
                aspectRatio: 100/100,
                child: Image.asset('assets/logo.png')
              ),
            ),
            Container(
              constraints: BoxConstraints.expand(height: 42),
              margin: EdgeInsets.only(left: 28, top: 42, right: 28),
              child: FlatButton(
                onPressed: () => this.onButtonSignInPressed(context),
                color: Color.fromARGB(255, 0, 176, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.5))),
                textColor: Color.fromARGB(255, 255, 255, 255),
                padding: EdgeInsets.all(0),
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Helvetica",
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Container(
                width: 78,
                height: 17,
                margin: EdgeInsets.only(top: 33),
                child: FlatButton(
                  onPressed: () => this.onHowToUsePressed(context),
                  color: Colors.transparent,
                  textColor: Color.fromARGB(102, 0, 0, 0),
                  padding: EdgeInsets.all(0),
                  child: Text(
                    "How to use?",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Helvetica",
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 17,
                    margin: EdgeInsets.only(bottom: 11),
                    child: Text(
                      "License by Norton University",
                      style: TextStyle(
                        color: Color.fromARGB(102, 0, 0, 0),
                        fontSize: 14,
                        fontFamily: "Helvetica",
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
