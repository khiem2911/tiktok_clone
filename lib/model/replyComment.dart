import 'package:tiktok_clone/model/author.dart';

class Replycomment {
  const Replycomment({required this.author, required this.text});

  final Author author;
  final String text;

  factory Replycomment.fromJsonToMap(Map<String, dynamic> json) {
    return Replycomment(
        author: Author(
            id: json['user']['id'],
            uniqueId: json['user']['unique_id'],
            nickname: json['user']['nickname'],
            avatar: json['user']['avatar']),
        text: json['text']);
  }
}
