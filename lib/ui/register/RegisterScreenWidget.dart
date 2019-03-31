import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../main/MainScreenWidget.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../models/user.dart';

class RegisterScreenWidget extends StatefulWidget {
  final String userid;
  RegisterScreenWidget({Key key, @required this.userid}) : super(key: key);

  @override
  _RegisterScreenWidgetState createState() => _RegisterScreenWidgetState();
}

class _RegisterScreenWidgetState extends State<RegisterScreenWidget> {
  var imageURL;
  var database = FirebaseDatabase.instance;
  var storage = FirebaseStorage.instance;
  var firstNameTextController =TextEditingController();
  var lastNameTextController =TextEditingController();
  UserData myUserData;
  DatabaseReference userRef;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final FirebaseDatabase database = FirebaseDatabase.instance; //Rather then just writing FirebaseDatabase(), get the instance.  
    userRef = database.reference().child('$widget.userid');
    userRef.onChildAdded.listen(_onEntryAdded);
  }

  _onEntryAdded(Event event) {
    setState(() {
      // add Sucess
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MainScreenWidget()),
        (Route<dynamic> route) => false);
    });
  }

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

  void onButtonSignInPressed(BuildContext context) {
    if (firstNameTextController.text.isNotEmpty && lastNameTextController.text.isNotEmpty){
      myUserData.imageURL =imageURL;
      myUserData.firstName =firstNameTextController.text;
      myUserData.lastName =lastNameTextController.text;
      userRef.push().set(myUserData.toJson());
    }else{
      this._showSnackBar("Please enter all field", context);
    }
    
  }

  void openCamera() {
    ImagePicker.pickImage(
      source: ImageSource.camera,
    ).then((image) => {this.uploadImage(image)});
    setState(() {});
  }

  void openGallery() {
    ImagePicker.pickImage(
      source: ImageSource.gallery,
    ).then((image) => {this.uploadImage(image)});
    setState(() {});
  }

  Widget displaySelectedFile(String imageURL, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      width: 100,
      height: 100,
      child: GestureDetector(
          onTap: () {
            print("selectImage");
            _optionsDialogBox(context);
          },
          child: imageURL == null
              ? buildEmptyContainer()
              : buildImageContainer(imageURL)));
  }

  Container buildEmptyContainer() {
    return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Icon(FontAwesomeIcons.camera),
              );
  }

  Container buildImageContainer(String imageURL) {
    return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Container(
                  width: 190.0,
                  height: 190.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image:  NetworkImage(
                              imageURL)
                      )
                  )),
              );
  }

  uploadImage(var imageFile) async {
    StorageReference ref = storage.ref().child("/photo.jpg");
    StorageUploadTask uploadTask = ref.putFile(imageFile);

    var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    var url = dowurl.toString();
    this.imageURL = url;
    setState(() {});
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
        backgroundColor: Color.fromARGB(255, 0, 176, 255),
        title: Text("Sign up"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 244, 244, 244),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            displaySelectedFile(imageURL, context),
            buildFirstNameContainer(),
            buildLastNameContainer(),
            buildSignUpContainer(context),
          ],
        ),
      ),
    );
  }

  Container buildSignUpContainer(BuildContext context) {
    return Container(
            constraints: BoxConstraints.expand(height: 42),
            margin: EdgeInsets.only(left: 43, top: 30, right: 43),
            child: FlatButton(
              onPressed: () => this.onButtonSignInPressed(context),
              color: Color.fromARGB(255, 0, 176, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.5))),
              textColor: Color.fromARGB(255, 255, 255, 255),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Helvetica",
                ),
                textAlign: TextAlign.left,
              ),
            ),
          );
  }

  Container buildLastNameContainer() {
    return Container(
            constraints: BoxConstraints.expand(height: 42),
            margin: EdgeInsets.only(left: 43, top: 16, right: 43),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Last name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(42)),
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

  Container buildFirstNameContainer() {
    return Container(
            constraints: BoxConstraints.expand(height: 42),
            margin: EdgeInsets.only(left: 43, top: 42, right: 43),
            child: TextField(
              decoration: InputDecoration(
                hintText: "First name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(42)),
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
}
