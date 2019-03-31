import 'package:flutter/material.dart';
import '../../models/my_class_model.dart';
import './my_class_item.dart';
import '../empty_state/empty_state_widget.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';

class MyClassListScreen extends StatefulWidget {
  @override
  _MyClassListScreenState createState() => _MyClassListScreenState();
}

class _MyClassListScreenState extends State<MyClassListScreen> {
  List<MyClassModel> myClasses = List();
  MyClassModel myClass;
  DatabaseReference itemRef;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    myClass = MyClassModel();
    final FirebaseDatabase database = FirebaseDatabase.instance; //Rather then just writing FirebaseDatabase(), get the instance.  
    itemRef = database.reference().child('my_classes');
    itemRef.onChildAdded.listen(_onEntryAdded);
    itemRef.onChildChanged.listen(_onEntryChanged);
  }

  _onEntryAdded(Event event) {
    setState(() {
      myClasses.add(MyClassModel.fromSnapshot(event.snapshot));
    });
  }

  _onEntryChanged(Event event) {
    var old = myClasses.singleWhere((entry) {
      return entry.id == event.snapshot.key;
    });
    setState(() {
      myClasses[myClasses.indexOf(old)] = MyClassModel.fromSnapshot(event.snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: myClasses == null || myClasses.length == 0 ? EmptyStateWidget(title: "No Class, Please create class",) : buildMyClassListView(),
    );
  }

  FirebaseAnimatedList buildMyClassListView() {
    return FirebaseAnimatedList(
      query: itemRef,
      itemBuilder: (BuildContext context, DataSnapshot snapshot,
          Animation<double> animation, int index) {
        return MyClassItem(
          item: myClasses[index],
        );
      },
    );
  }
}
