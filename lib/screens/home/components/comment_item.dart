import 'package:flutter/material.dart';
import 'package:tiktok_clone/model/comments.dart';
import 'package:tiktok_clone/model/replyComment.dart';
import 'package:tiktok_clone/services/api.dart';

class CommentItem extends StatefulWidget {
  const CommentItem({super.key, required this.comment, required this.videoId});
  final Comments comment;
  final String videoId;

  @override
  State<StatefulWidget> createState() {
    return _CommentItemState();
  }
}

class _CommentItemState extends State<CommentItem> {
  List<Replycomment>? repliesComments;
  bool showRepliesComments = false;

  void _loadingRepliesComments(String videoId, String commentId) async {
    final data = await getRepliesComments(videoId, commentId);
    setState(() {
      repliesComments = data;
      showRepliesComments = !showRepliesComments;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.comment.author.avatar),
          ),
          title: Text(widget.comment.author.uniqueId),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.comment.text),
            ],
          ),
          trailing: const Column(
            children: [Icon(Icons.favorite_border), Text('0')],
          ),
        ),
        if (repliesComments != null)
          InkWell(
              onTap: () => _loadingRepliesComments(
                  widget.videoId, widget.comment.commentId),
              child: const Padding(
                padding: EdgeInsets.only(left: 70),
                child: Text('View replies'),
              )),
        showRepliesComments && repliesComments!.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  children: repliesComments!
                      .map((item) => ListTile(
                            leading: CircleAvatar(
                              foregroundImage: NetworkImage(item.author.avatar),
                            ),
                            title: Text(item.author.uniqueId),
                            subtitle: Text(item.text),
                          ))
                      .toList(),
                ),
              )
            : const Text('')
      ],
    );
  }
}
