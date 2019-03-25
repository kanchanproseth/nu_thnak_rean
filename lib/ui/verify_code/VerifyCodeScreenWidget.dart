import 'package:flutter/material.dart';
import './PinCode.dart';

class VerifyCodeScreenWidget extends StatelessWidget {
  final String verificationId;
  void onIDidnTGetACodePressed(BuildContext context) {}

  VerifyCodeScreenWidget({Key key, @required this.verificationId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Verify Code"),
        backgroundColor: Color.fromARGB(255, 0, 176, 255),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 244, 244, 244),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Text(
                    "Enter the verify code",
                    style: TextStyle(
                      color: Color.fromARGB(179, 0, 0, 0),
                      fontSize: 20,
                      fontFamily: "Helvetica",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                PinCode(verificationId: verificationId),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      constraints: BoxConstraints.expand(height: 42),
                      padding: EdgeInsets.all(10),
                      child: FlatButton(
                        onPressed: () => this.onIDidnTGetACodePressed(context),
                        color: Colors.transparent,
                        textColor: Color.fromARGB(255, 0, 176, 255),
                        padding: EdgeInsets.all(0),
                        child: Text(
                          "I didn’t get a code",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Helvetica",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Tab Continue to accept Facebook ’s Terms, Data Policy and cookie use.",
                    style: TextStyle(
                      color: Color.fromARGB(128, 0, 0, 0),
                      fontSize: 14,
                      fontFamily: "Helvetica",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
