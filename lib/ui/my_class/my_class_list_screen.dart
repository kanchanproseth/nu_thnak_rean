import 'package:flutter/material.dart';
import '../../models/my_class_model.dart';
import './my_class_item.dart';
import '../empty_state/empty_state_widget.dart';

class MyClassListScreen extends StatelessWidget {
  final List<MyClassModel> myClasses;

  MyClassListScreen({this.myClasses});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 244, 244, 244),
      ),
      child: myClasses == null
            ? EmptyStateWidget()
            :buildMyClassListView(),
    );
  }

  ListView buildMyClassListView() {
    return ListView.builder(
      itemCount: myClasses.length,
      itemBuilder: _itemBuilder,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return MyClassItem(
      item: myClasses[index],
    );
  }
}
