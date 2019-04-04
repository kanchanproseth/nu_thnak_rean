import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/my_class_model.dart';

class MyClassApiProvider {
  static Future<List<MyClassModel>> fetchMyClassList(
      BuildContext context) async {
    final response = await DefaultAssetBundle.of(context)
        .loadString("assets/my_class_list_mock_data.json");
    final List<dynamic> results = json.decode(response);
    final data =
        results.map((parsedJson) => MyClassModel.fromJson(parsedJson)).toList();
        print(data);
    return data;
  }

  static Future<MyClassModel> fetchMyClassById(
      BuildContext context, String id) async {
    final classes = await MyClassApiProvider.fetchMyClassList(context);
    final myClass = classes.where((cl) => cl.id == id).first;
    return myClass;
  }
}
