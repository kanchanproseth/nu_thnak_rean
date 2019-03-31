import 'package:firebase_database/firebase_database.dart';

class UserData {
String id;
String firstName;
String lastName;
String imageURL;


UserData({this.id, this.firstName, this.lastName, this.imageURL});

    UserData.fromSnapshot(DataSnapshot snapshot) :
    id = snapshot.key,
    firstName = snapshot.value['first_name'],
    lastName = snapshot.value['last_name'],
    imageURL = snapshot.value['image_url'];

    toJson(){
      return {
        'first_name' : firstName,
        'last_name' : lastName,
        'image_url' : imageURL
      };
    }
}