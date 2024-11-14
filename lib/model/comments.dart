import 'package:tiktok_clone/model/author.dart';

class Comments {
  const Comments(
      {required this.author,
      required this.timeCreate,
      required this.text,
      required this.commentId});

  final Author author;
  final int timeCreate;
  final String commentId;
  final String text;

  factory Comments.fromJsonToMap(Map<String, dynamic> json) {
    return Comments(
        author: Author(
            id: json['user']['id'],
            uniqueId: json['user']['unique_id'],
            nickname: json['user']['nickname'],
            avatar: json['user']['avatar']),
        timeCreate: json['create_time'],
        commentId: json['id'],
        text: json['text']);
  }
}
