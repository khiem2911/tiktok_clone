import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  const VideoPlayerItem(
      {super.key,
      required this.videoUrl,
      required this.sound,
      required this.videoThumbnail});
  final String videoUrl;
  final String videoThumbnail;
  final double sound;

  @override
  State<VideoPlayerItem> createState() {
    return VideoPlayerItemState();
  }
}

class VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _videoController;
  bool check = true;

  @override
  void dispose() {
    super.dispose();
    print('okla');
    _videoController.dispose();
  }

  void _onHandlerVideo(bool checked) {
    if (checked) {
      _videoController.pause();
    } else {
      _videoController.play();
    }
    setState(() {
      check = !check;
    });
  }

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
          ..initialize().then((_) {
            setState(() {});
            _videoController.play();
            _videoController.setLooping(true);
            _videoController.setVolume(widget.sound);
          });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onHandlerVideo(check),
      child: Container(
          width: double.infinity,
          height: double.infinity,
          child: _videoController.value.isInitialized
              ? VideoPlayer(_videoController)
              : Image.network(
                  widget.videoThumbnail,
                  fit: BoxFit.cover,
                )),
    );
  }
}
