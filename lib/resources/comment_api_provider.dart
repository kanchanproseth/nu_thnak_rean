import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/comment_model.dart';

class CommentApiProvider {
  static Future<List<CommentModel>> fetchCommentList(
      BuildContext context) async {
    final response = await DefaultAssetBundle.of(context)
        .loadString("assets/comment_list_mock_data.json");
    final List<dynamic> results = json.decode(response);
    final comments =
        results.map((parsedJson) => CommentModel.fromJson(parsedJson)).toList();
    return comments;
  }
}
