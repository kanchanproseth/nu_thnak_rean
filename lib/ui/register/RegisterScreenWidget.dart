import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';

class RegisterScreenWidget extends StatelessWidget {
  var image;
  final String userid;
  var database = FirebaseDatabase.instance;
  void onButtonSignInPressed(BuildContext context) {
    // database.reference().child("users").set(value)
  }

  RegisterScreenWidget({Key key, @required this.userid}) : super(key: key);

  void openCamera() {
    ImagePicker.pickImage(
      source: ImageSource.camera,
    ).then((image) => {this.image = image});
  }

  void openGallery() {
    ImagePicker.pickImage(
      source: ImageSource.gallery,
    ).then((image) => {this.image = image});
  }

  Future<void> _optionsDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: new Text('Take a picture'),
                    onTap: openCamera,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: new Text('Select from gallery'),
                    onTap: openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 0, 176, 255),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 244, 244, 244),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // open gallary
                        },
                        child: Container(
                          constraints: BoxConstraints.expand(width: 125),
                          margin: EdgeInsets.only(top: 111),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 151, 151, 151),
                              width: 0.5,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(62.5)),
                          ),
                          child: Image.asset(
                            "assets/images/photo-camera.png",
                            fit: BoxFit.none,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        constraints: BoxConstraints.expand(width: 100),
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: FlatButton(
                          onPressed: () {},
                          color: Color.fromARGB(255, 0, 0, 0),
                          textColor: Color.fromARGB(255, 255, 255, 255),
                          padding: EdgeInsets.all(0),
                          child: Text(
                            "Click me",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "",
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        constraints: BoxConstraints.expand(width: 12),
                        margin: EdgeInsets.only(left: 8, top: 49),
                        child: Image.asset(
                          "assets/images/arrow--copy-2.png",
                          fit: BoxFit.none,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints.expand(height: 44),
              margin: EdgeInsets.only(left: 43, top: 42, right: 43),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Pov",
                  contentPadding: EdgeInsets.all(0),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Color.fromARGB(102, 0, 0, 0),
                  fontSize: 14,
                  fontFamily: "Helvetica",
                ),
                maxLines: 1,
                autocorrect: false,
              ),
            ),
            Container(
              constraints: BoxConstraints.expand(height: 44),
              margin: EdgeInsets.only(left: 43, top: 16, right: 43),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Vichit",
                  contentPadding: EdgeInsets.all(0),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Color.fromARGB(102, 0, 0, 0),
                  fontSize: 14,
                  fontFamily: "Helvetica",
                ),
                maxLines: 1,
                autocorrect: false,
              ),
            ),
            Opacity(
              opacity: 0.46,
              child: Container(
                constraints: BoxConstraints.expand(height: 44),
                margin: EdgeInsets.only(left: 43, top: 16, right: 43),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "+855967778881",
                    contentPadding: EdgeInsets.all(0),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: Color.fromARGB(102, 0, 0, 0),
                    fontSize: 14,
                    fontFamily: "Helvetica",
                  ),
                  maxLines: 1,
                  autocorrect: false,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Container(
                width: 318,
                height: 41,
                margin: EdgeInsets.only(top: 35),
                child: FlatButton(
                  onPressed: () => this.onButtonSignInPressed(context),
                  color: Color.fromARGB(255, 0, 176, 255),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.5))),
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  padding: EdgeInsets.all(0),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Helvetica",
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
