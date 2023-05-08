import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_json/network_service_models/comment_model.dart';
import 'package:flutter_json/network_service_models/my_model.dart';
import 'package:flutter_json/network_service_models/user_model.dart';

Future<List<CommentModel>> getCommentData() async {
  try {
    List<CommentModel> commentList = [];
    const String url = 'https://jsonplaceholder.typicode.com/comments';
    final response = await Dio().get(url);
    if (response.statusCode == 200) {
      commentList =
          (response.data as List).map((e) => CommentModel.fromMap(e)).toList();
    }
    return commentList;
  } catch (e) {
    Future.error(e.toString());
    return [];
  }
}

Future<List<UserModel>> userData() async {
  try {
    const String url = "https://jsonplaceholder.typicode.com/users";
    var response = await Dio().get(url);
    List<UserModel> userList = [];
    if (response.statusCode == 200) {
      userList =
          (response.data as List).map((e) => UserModel.fromMap((e))).toList();
    }
    return userList;
  } catch (e) {
    debugPrint(e.toString());
    return Future.error(e);
  }
}

Future<List<PhotoModel>> getData() async {
  try {
    const String url = 'https://jsonplaceholder.typicode.com/photos';

    var response = await Dio().get(url);

    List<PhotoModel> modelList = [];

    if (response.statusCode == 200) {
      modelList =
          (response.data as List).map((e) => PhotoModel.fromMap(e)).toList();
    }

    return modelList;
  } catch (e) {
    return Future.error(e);
  }
}
