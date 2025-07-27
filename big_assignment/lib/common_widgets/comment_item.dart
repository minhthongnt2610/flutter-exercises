import 'package:big_assignment/constants/app_icons.dart';
import 'package:big_assignment/data/models/comment_model.dart';
import 'package:big_assignment/data/models/like_comment_status.dart';
import 'package:big_assignment/extensions/date_time_extension.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatefulWidget {
  const CommentItem({
    super.key,
    required this.commentModel,
    required this.onLikeCommentStatusChanged,
  });

  final CommentModel commentModel;
  final ValueChanged<LikeCommentStatus> onLikeCommentStatusChanged;
  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  int numberLike = 0;
  bool isLiked = false;
  @override
  void initState() {
    super.initState();
    numberLike = widget.commentModel.numberLikeComment;
  }

  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(widget.commentModel.urlAvatar),
          ),
          SizedBox(width: 10 * height / 868),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.commentModel.nameUserComment,
                  style: TextStyle(
                    fontSize: 13 * height / 868,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'proxima nova',
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 5 * height / 868),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.commentModel.content,
                        style: TextStyle(
                          fontSize: 15 * height / 868,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'proxima nova',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 10 * height / 868),
                    Text(
                      '${widget.commentModel.timeComment.displayDateString()}p',
                      style: TextStyle(
                        fontSize: 13 * height / 868,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'proxima nova',
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        if (isLiked) {
                          widget.onLikeCommentStatusChanged
                              .call(LikeCommentStatus.unlike);
                          numberLike--;
                        } else {
                          widget.onLikeCommentStatusChanged
                              .call(LikeCommentStatus.likeComment);
                          numberLike++;
                        }
                        isLiked = !isLiked;
                      },
                    );
                  },
                  child: Image.asset(
                    isLiked ? AppIcons.likeComment : AppIcons.unLikeComment,
                    width: 15.5 * height / 868,
                    height: 13.5 * height / 868,
                  ),
                ),
                SizedBox(height: 3.41 * height / 868),
                Text(
                  numberLike.toString(),
                  style: TextStyle(
                    fontSize: 13 * height / 868,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'proxima nova',
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
