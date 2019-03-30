import 'package:flutter/material.dart';

class ClassInformation {
      String name;
      String desc;
      String session;
      String roomname;
      String subject;
  // ClassInformation(this.name, this.desc, this.session, this.roomname, this.subject);
}

class CreateClass extends StatelessWidget {
  Function createClass;
  final String title;
  var classInfo =ClassInformation();

  var classNameTextController = TextEditingController();
  var classDescTextController = TextEditingController();
  var sessionTextController = TextEditingController();
  var roomTextController = TextEditingController();
  var subjectTextController = TextEditingController();

  void _showSnackBar(String text, BuildContext context) {
      final snackBar = SnackBar(
        duration: Duration(milliseconds: 500),
        content: Container(
            height: 30.0,
            child: Center(
              child: Text(
                text,
                style: TextStyle(fontSize: 16.0),
              ),
            )),
        backgroundColor: Colors.red,
      );
      Scaffold.of(context).showSnackBar(snackBar);
  }

  CreateClass({Key key, @required this.title, this.createClass}) : super(key: key);
  void onButtonCreatePressed(BuildContext context) {
    if (classNameTextController.text.isEmpty||
    classDescTextController.text.isEmpty||
    sessionTextController.text.isEmpty||
    roomTextController.text.isEmpty||
    subjectTextController.text.isEmpty){
    this._showSnackBar("Please enter all field", context);
    }else{
      classInfo.name = classNameTextController.text;
      classInfo.desc = classDescTextController.text;
      classInfo.session = sessionTextController.text;
      classInfo.roomname = roomTextController.text;
      classInfo.subject = subjectTextController.text;
      createClass(classInfo);
      // Navigator.of(context).pop();
    }
  }
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        // title: Text(this.title),
        backgroundColor: Colors.amber,
      ),
      body: Builder(builder: (BuildContext context){
        return Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: SingleChildScrollView(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildClassNameTextfieldContainer(),
                buildClassDescriptionTextfieldContainer(),
                buildSessionTextfieldContainer(),
                buildRoomTextfieldContainer(),
                buildSubjectTextfieldContainer(),
                buildUpdateButtonContainer(context),
              ],
            ),
          ),
        );
      }),
    );
  }

  Container buildClassNameTextfieldContainer() {
    return Container(
            constraints: BoxConstraints.expand(height: 44),
            margin: EdgeInsets.only(left: 35, top: 67),
            child: TextField(
              controller: classNameTextController,
              decoration: InputDecoration(
                hintText: "Master Ecommerce 01 ",
                labelText: "Class name",
                contentPadding: EdgeInsets.all(0),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    style: BorderStyle.solid
                  ),
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "Helvetica",
              ),
              maxLines: 1,
              autocorrect: false,
            ),
          );
  }

  Container buildClassDescriptionTextfieldContainer() {
    return Container(
            constraints: BoxConstraints.expand(height: 44),
            margin: EdgeInsets.only(left: 35, top: 16),
            child: TextField(
              controller: classDescTextController,
              decoration: InputDecoration(
                hintText: "Class Description",
                labelText: "Description",
                contentPadding: EdgeInsets.all(0),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    style: BorderStyle.solid
                  ),
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "Helvetica",
              ),
              maxLines: 1,
              autocorrect: false,
            ),
          );
  }

  Container buildSessionTextfieldContainer() {
    return Container(
            constraints: BoxConstraints.expand(height: 44),
            margin: EdgeInsets.only(left: 35, top: 16),
            child: TextField(
              controller: sessionTextController,
              decoration: InputDecoration(
                hintText: "Evening",
                labelText: "Session",
                contentPadding: EdgeInsets.all(0),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    style: BorderStyle.solid
                  ),
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "Helvetica",
              ),
              maxLines: 1,
              autocorrect: false,
            ),
          );
  }

  Container buildRoomTextfieldContainer() {
    return Container(
            constraints: BoxConstraints.expand(height: 44),
            margin: EdgeInsets.only(left: 35, top: 16),
            child: TextField(
              controller: roomTextController,
              decoration: InputDecoration(
                hintText: "G-001",
                labelText: "Room",
                contentPadding: EdgeInsets.all(0),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    style: BorderStyle.solid
                  ),
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "Helvetica",
              ),
              maxLines: 1,
              autocorrect: false,
            ),
          );
  }

  Container buildSubjectTextfieldContainer() {
    return Container(
            constraints: BoxConstraints.expand(height: 44),
            margin: EdgeInsets.only(left: 35, top: 16),
            child: TextField(
              controller: subjectTextController,
              decoration: InputDecoration(
                hintText: "Ecommerce",
                labelText: "Subject",
                contentPadding: EdgeInsets.all(0),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    style: BorderStyle.solid
                  ),
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "Helvetica",
              ),
              maxLines: 1,
              autocorrect: false,
            ),
          );
  }

  Container buildUpdateButtonContainer(BuildContext context) {
    return Container(
            alignment: Alignment.topCenter,
            child: Container(
              width: 236,
              height: 41,
              margin: EdgeInsets.only(top: 25),
              child: FlatButton(
                onPressed: () => this.onButtonCreatePressed(context),
                color: Color.fromARGB(255, 0, 176, 255),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.5))),
                textColor: Colors.white,
                padding: EdgeInsets.all(0),
                child: Text(
                  "Update",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Helvetica",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
  }
}