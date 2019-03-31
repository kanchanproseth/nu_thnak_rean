import 'package:firebase_database/firebase_database.dart';

import 'package:firebase_database/firebase_database.dart';

class Member {
String id;
String name;
String email;
String phoneNumber;

Member({this.id, this.name, this.email, this.phoneNumber});

  Member.fromJson(Map<String, dynamic> parsedJson)
    : id = parsedJson['id'],
      name = parsedJson['name'],
      email = parsedJson['email'],
      phoneNumber = parsedJson['phone_number'];

    Member.fromSnapshot(DataSnapshot snapshot) :
    id = snapshot.key,
    name = snapshot.value['name'],
    email = snapshot.value['email'],
    phoneNumber = snapshot.value['phone_number'];

    toJson(){
      return {
        'id' : id,
        'name' : name,
        'email' : email,
        'phone_number' : phoneNumber,
      };
    }



}