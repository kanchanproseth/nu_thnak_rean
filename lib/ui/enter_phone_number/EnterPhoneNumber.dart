import 'package:flutter/material.dart';
import '../verify_code/VerifyCodeScreenWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EnterPhoneNumber extends StatefulWidget {
  _EnterPhoneNumberState createState() => _EnterPhoneNumberState();
}

class _EnterPhoneNumberState extends State<EnterPhoneNumber> {
  var _phoneNumberController = TextEditingController();
  var _phoneNumber;

  /// Sends the code to the specified phone number.
  Future<void> _sendCodeToPhoneNumber() async {
    final PhoneVerificationCompleted verificationCompleted =
        (FirebaseUser user) {
      setState(() {
        print(
            'Inside _sendCodeToPhoneNumber: signInWithPhoneNumber auto succeeded: $user');
      });
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      setState(() {
        print(
            'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
      });
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      print("code sent to " + _phoneNumber);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  VerifyCodeScreenWidget(verificationId: verificationId)));
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      print("time out");
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _phoneNumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 244, 244, 244),
      ),
      child: Container(
        padding: EdgeInsets.only(top: 129, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Enter your phone number",
              style: TextStyle(
                color: Color.fromARGB(179, 0, 0, 0),
                fontSize: 20,
                fontFamily: "Helvetica",
              ),
              textAlign: TextAlign.left,
            ),
            Container(
              constraints: BoxConstraints.expand(height: 42),
              margin: EdgeInsets.only(left: 1, top: 36, right: 1),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints.expand(width: 61),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                    child: Text("+855"),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                      child: TextField(
                        controller: _phoneNumberController,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          contentPadding: EdgeInsets.only(left: 10, right: 10),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 12,
                          fontFamily: "Monaco",
                        ),
                        maxLines: 1,
                        autocorrect: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 289,
              child: Text(
                "When you tap Next, Account kit by Facebook will send you an SMS to confirm your phone number. Message and data rates my apply. You don’t need a Facebook account",
                style: TextStyle(
                  color: Color.fromARGB(128, 0, 0, 0),
                  fontSize: 14,
                  fontFamily: "Helvetica",
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              constraints: BoxConstraints.expand(height: 42),
              child: FlatButton(
                onPressed: () => {
                      this._phoneNumber =
                          '+855' + this._phoneNumberController.text,
                      this._sendCodeToPhoneNumber()
                    },
                color: Color.fromARGB(255, 0, 176, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                textColor: Color.fromARGB(255, 255, 255, 255),
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Helvetica",
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
