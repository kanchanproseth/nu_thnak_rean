import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pin_put/pin_put_bloc.dart';
import 'package:pinput/pin_put/pin_put_state.dart';
import '../register/RegisterScreenWidget.dart';

class PinCode extends StatefulWidget {
  final String verificationId;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PinCodeState();
  }
  PinCode({Key key, @required this.verificationId}) : super(key: key);
}

class PinCodeState extends State<PinCode>{
  var _auth = FirebaseAuth.instance;
  // var pin_put_bloc = PinPutBloc();
  // var pin_put_state = PinPutState();
  String userid;
  
  void navigateToRegister(BuildContext context, String userID){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => RegisterScreenWidget(userid: userID))
  );
  }

  Future<bool> _signInWithPhoneNumber(
      String smsCode, String verificationId) async {
      var credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    print(verificationId);
    print(smsCode);
    try {
      var user = await _auth.signInWithCredential(credential);
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      this.userid = user.uid;
    return true;
    } catch (e) {
      return false;
    }
  }

  void _showSnackBar(bool result, String userid, BuildContext context) {
    if (result == true){
      final snackBar = SnackBar(
        duration: Duration(seconds: 1),
        content: Container(
            height: 40.0,
            child: Center(
              child: Text(
                'Login Successfully',
                style: TextStyle(fontSize: 16.0),
              ),
            )),
        backgroundColor: Colors.red,
      );
      Scaffold.of(context).showSnackBar(snackBar);
      print("sign in success");
      navigateToRegister(context, userid);
    }else{
      final snackBar = SnackBar(
        duration: Duration(seconds: 1),
        content: Container(
            height: 40.0,
            child: Center(
              child: Text(
                'Pin incorrect.',
                style: TextStyle(fontSize: 16.0),
              ),
            )),
        backgroundColor: Colors.red,
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
      
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: PinPut(
          actionButtonsEnabled: false,
          isTextObscure: true,
          fieldsCount: 6,
          onSubmit: (String pin) => {
            this._signInWithPhoneNumber(pin, widget.verificationId).then((result) =>{
              _showSnackBar(result, this.userid, context)
            })
            }
        ),
      ),
    );;
  }
}