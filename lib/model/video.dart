import 'package:tiktok_clone/model/author.dart';
import 'package:tiktok_clone/model/music.dart';

class Video {
  const Video({
    required this.videoUrl,
    required this.commentCount,
    required this.des,
    required this.author,
    required this.videoThumbNail,
    required this.music,
    required this.videoId,
  });

  final String videoUrl;
  final int commentCount;
  final String videoThumbNail;
  final String videoId;
  final Music music;
  final String des;
  final Author author;

  factory Video.fromJsonToMap(Map<String, dynamic> json) {
    return Video(
        videoUrl: json['play'],
        music: Music(
            musicId: json['music_info']['id'],
            musicThumbNail: json['music_info']['cover'],
            musicTitle: json['music_info']['title']),
        videoId: json['video_id'],
        commentCount: json['comment_count'],
        des: json['title'],
        videoThumbNail: json['origin_cover'],
        author: Author(
            id: json['author']['id'],
            uniqueId: json['author']['unique_id'],
            nickname: json['author']['nickname'],
            avatar: json['author']['avatar']));
  }
}
