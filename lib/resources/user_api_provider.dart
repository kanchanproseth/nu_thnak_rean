import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserApiProvider {
  static Future<List<UserModel>> fetchMyClassList(
      BuildContext context) async {
    final response = await DefaultAssetBundle.of(context)
        .loadString("assets/user_list_mock_data.json");
    final List<dynamic> results = json.decode(response);
    final users =
        results.map((parsedJson) => UserModel.fromJson(parsedJson)).toList();
    return users;
  }
}
