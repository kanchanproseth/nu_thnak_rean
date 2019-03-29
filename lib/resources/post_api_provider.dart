import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/post_model.dart';

class PostApiProvider {

  static Future<List<PostModel>> fetchMyClassList(BuildContext context) async {
    final response = await DefaultAssetBundle.of(context).loadString("assets/post_list_mock_data.json");
    final List<dynamic> results = json.decode(response);
    final data = results.map((parsedJson) => PostModel.fromJson(parsedJson)).toList();
    return data;
  }
}
