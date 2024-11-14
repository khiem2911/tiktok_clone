import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tiktok_clone/model/comments.dart';
import 'package:tiktok_clone/model/replyComment.dart';
import 'package:tiktok_clone/model/video.dart';

Future<List<Video>> onFetchVideos() async {
  final res = await http.get(
      Uri.parse(
          'https://tiktok-scraper7.p.rapidapi.com/challenge/posts?challenge_id=33380&count=20&cursor=8'),
      headers: {
        'x-rapidapi-key': '4b7b4717damsh4a4246c63896553p1d373cjsn182340b83efe'
      });
  final result = jsonDecode(res.body);
  List<dynamic> tempt = result['data']['videos'];
  List<Video> videos = tempt.map((data) => Video.fromJsonToMap(data)).toList();
  return videos;
}

Future<List<Comments>> getVideoComments(String videoId) async {
  final url =
      'https://tiktok-scraper7.p.rapidapi.com/comment/list?url=https%3A%2F%2Fwww.tiktok.com%2F%40tiktok%2Fvideo%2F${videoId}';
  final res = await http.get(Uri.parse(url), headers: {
    'x-rapidapi-key': '4b7b4717damsh4a4246c63896553p1d373cjsn182340b83efe'
  });

  final result = jsonDecode(res.body);
  List<dynamic> tempt = result['data']['comments'];
  List<Comments> comments =
      tempt.map((item) => Comments.fromJsonToMap(item)).toList();

  return comments;
}

Future<List<Replycomment>> getRepliesComments(
    String videoId, String commentId) async {
  final url =
      'https://tiktok-scraper7.p.rapidapi.com/comment/reply?video_id=${videoId}&comment_id=${commentId}&count=10&cursor=0';
  final res = await http.get(Uri.parse(url), headers: {
    'x-rapidapi-key': '4b7b4717damsh4a4246c63896553p1d373cjsn182340b83efe'
  });

  final result = jsonDecode(res.body);
  List<dynamic> tempt = result['data']['comments'];
  List<Replycomment> repliesComments =
      tempt.map((item) => Replycomment.fromJsonToMap(item)).toList();
  return repliesComments;
}

void getMusicVideos(String musicId) async {
  final url =
      'https://tiktok-scraper7.p.rapidapi.com/music/posts?music_id=${musicId}&count=10&cursor=0';
  final res = await http.get(Uri.parse(url));

  final result = jsonDecode(res.body);
  List<Video> musicVideo = result['data']['videos'];
}
