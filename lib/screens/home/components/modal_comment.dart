import 'package:flutter/material.dart';
import 'package:tiktok_clone/model/comments.dart';
import 'package:tiktok_clone/model/video.dart';
import 'package:tiktok_clone/screens/home/components/comment_item.dart';
import 'package:tiktok_clone/services/api.dart';

class ModalComment extends StatefulWidget {
  const ModalComment({super.key, required this.video});
  final Video video;

  @override
  State<ModalComment> createState() => _ModalCommentState();
}

class _ModalCommentState extends State<ModalComment> {
  bool isLoading = true;
  List<Comments>? comments;

  @override
  void initState() {
    super.initState();
    _loadingVideoComments();
  }

  void _loadingVideoComments() async {
    final data = await getVideoComments(widget.video.videoId);
    setState(() {
      comments = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              Center(
                child: Text(
                  '${widget.video.commentCount} comments',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListView.builder(
                          itemCount: comments!.length,
                          itemBuilder: (builder, index) {
                            final time = comments![index].timeCreate;
                            DateTime date = DateTime.fromMillisecondsSinceEpoch(
                                time * 1000);
                            return CommentItem(
                                videoId: widget.video.videoId,
                                comment: comments![index]);
                          }),
                    )
            ],
          ),
        ),
      ),
      Positioned(
        top: 12,
        right: 25,
        child: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.close)),
      )
    ]);
  }
}
