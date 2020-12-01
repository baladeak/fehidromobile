import 'package:flutter/cupertino.dart';

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({
    @required this.userId
    , @required this.id, @required this.title, @required this.body});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] as int;
    id = json['id'] as int ;
    title = json['title'] as String;
    body = json['body'] as String;
  }
}
