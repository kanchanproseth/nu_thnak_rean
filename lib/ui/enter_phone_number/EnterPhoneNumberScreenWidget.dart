
import 'package:flutter/material.dart';
import './EnterPhoneNumber.dart';

class EnterPhoneNumberScreenWidget extends StatelessWidget {
  TextEditingController _phoneNumberController = TextEditingController();
  String _phoneNumber ;
  String verificationId;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Phone Number"),
      ),
      body: EnterPhoneNumber()
    );
  }
}