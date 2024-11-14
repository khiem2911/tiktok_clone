import 'package:flutter/material.dart';
import 'package:tiktok_clone/model/video.dart';

class BottomSideBar extends StatelessWidget {
  const BottomSideBar({super.key, required this.video});
  final Video video;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '@${video.author.nickname}',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            video.des,
            softWrap: true,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children: [
              const Icon(
                Icons.music_note,
                color: Colors.white,
              ),
              Text(
                video.music.musicTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
