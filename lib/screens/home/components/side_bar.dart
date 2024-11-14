import 'package:flutter/material.dart';
import 'package:tiktok_clone/model/video.dart';
import 'package:tiktok_clone/screens/home/components/modal_comment.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key, required this.video});
  final Video video;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000))
      ..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _onModalComment(Video item) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ModalComment(video: item);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.video.author.avatar)),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1)),
        ),
        const SizedBox(
          height: 34,
        ),
        Column(
          children: [
            const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 35,
            ),
            const Text(
              '4445',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => _onModalComment(widget.video),
              child: SizedBox(
                child: Column(
                  children: [
                    const Icon(
                      Icons.comment_sharp,
                      color: Colors.white,
                      size: 35,
                    ),
                    Text(
                      widget.video.commentCount.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Icon(
              Icons.share,
              color: Colors.white,
              size: 35,
            ),
            const Text(
              'Share',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
        RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: Container(
            width: 50,
            height: 50,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.network(
              widget.video.music.musicThumbNail,
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
