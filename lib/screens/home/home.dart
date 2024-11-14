import 'package:flutter/material.dart';
import 'package:tiktok_clone/model/video.dart';
import 'package:tiktok_clone/screens/home/components/bottom_side_bar.dart';
import 'package:tiktok_clone/screens/home/components/side_bar.dart';
import 'package:tiktok_clone/screens/home/components/video_player_item.dart';
import 'package:tiktok_clone/screens/splash/splash.dart';
import 'package:tiktok_clone/services/api.dart';
import 'package:volume_controller/volume_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pageController = PageController(initialPage: 0);
  double sound = 0;
  bool check = true;
  bool isLoading = true;
  List<Video>? videos;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchVideos();
    VolumeController().getVolume().then((volume) => setState(() {
          sound = volume;
        }));
  }

  void _fetchVideos() async {
    final data = await onFetchVideos();
    setState(() {
      videos = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Splash()
          : PageView.builder(
              controller: _pageController,
              itemCount: videos!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    VideoPlayerItem(
                      videoUrl: videos![index].videoUrl,
                      sound: sound,
                      videoThumbnail: videos![index].videoThumbNail,
                    ),
                    Positioned(
                        top: 400,
                        right: 10,
                        child: SideBar(
                          video: videos![index],
                        )),
                    Positioned(
                        left: 12,
                        bottom: 10,
                        child: BottomSideBar(video: videos![index]))
                  ],
                );
              }),
    );
  }
}
