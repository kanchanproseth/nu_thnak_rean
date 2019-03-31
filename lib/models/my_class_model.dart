import 'package:firebase_database/firebase_database.dart';
import './member.dart';

class MyClassModel {
String id;
String name;
String desc;
List<dynamic> member;
String section;
String room;
String subject;

MyClassModel({this.id, this.name, this.desc, this.member, this.section, this.room, this.subject});

  MyClassModel.fromJson(Map<String, dynamic> parsedJson)
    : id = parsedJson['id'],
      name = parsedJson['name'],
      desc =parsedJson['description'],
      member = parsedJson['member'],
      section = parsedJson['section'],
      room = parsedJson['room'],
      subject = parsedJson['subject'];

    MyClassModel.fromSnapshot(DataSnapshot snapshot) :
    id = snapshot.key,
    name = snapshot.value['name'],
    desc = snapshot.value['description'],
    member = snapshot.value['member'],
    section = snapshot.value['section'],
    room = snapshot.value['room'],
    subject = snapshot.value['subject'];

    toJson(){
      return {
        'name' : name,
        'description' : desc,
        'member' : member,
        'section' : section,
        'room' : room,
        'subject' : subject
      };
    }
}