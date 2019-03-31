import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/post_model.dart';

class PostApiProvider {
  static Future<List<PostModel>> fetchPostList(BuildContext context) async {
    final response = await DefaultAssetBundle.of(context)
        .loadString("assets/post_list_mock_data.json");
    final List<dynamic> results = json.decode(response);
    final data =
        results.map((parsedJson) => PostModel.fromJson(parsedJson)).toList();
    return data;
  }

  static Future<List<PostModel>> fetchPostListByType(
      BuildContext context, String type) async {
    final response = await DefaultAssetBundle.of(context)
        .loadString("assets/post_list_mock_data.json");
    final List<dynamic> results = json.decode(response);
    final data =
        results.map((parsedJson) => PostModel.fromJson(parsedJson)).toList();
    final posts = data.map((d) {
      d.postType = type;
      return d;
    }).toList();
    return posts;
  }

  static Future<List<PostModel>> fetchPostListByUserAndFilter(
      BuildContext context, int userId, String filter) async {
    List<PostModel> result;
    if (filter == 'Active' ||
        filter == 'Expired' ||
        filter == 'Schedule Posts') {
      result = await PostApiProvider.fetchPostListByStatus(context, filter);
    } else {
      result = await PostApiProvider.fetchPostListByType(context, filter);
    }

    final posts = result.map((r) {
      r.by = userId == 1 ? "Parodora" : r.by;
      return r;
    }).toList();
    return posts;
  }

  static Future<List<PostModel>> fetchPostListByStatus(
      BuildContext context, String status) async {
    final response = await DefaultAssetBundle.of(context)
        .loadString("assets/post_list_mock_data.json");
    final List<dynamic> results = json.decode(response);
    final data =
        results.map((parsedJson) => PostModel.fromJson(parsedJson)).toList();
    final posts = data.map((d) {
      d.status = status;
      return d;
    }).toList();
    return posts;
  }

  static Future<PostModel> fetchPostById(BuildContext context, int id) async {
    final posts = await PostApiProvider.fetchPostList(context);
    final post = posts.firstWhere((post) => post.id == id);
    return post; 
  }
}
