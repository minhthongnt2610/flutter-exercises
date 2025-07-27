// // import 'package:big_assignment/data/models/tiktok_model.dart';
// // import 'package:flutter/material.dart';
// //
// // import '../../../common_widgets/comment_item.dart';
// //
// // class CommentSheetWidget extends StatefulWidget {
// //   const CommentSheetWidget({super.key, required this.tiktokModel});
// //   final TiktokModel tiktokModel;
// //   @override
// //   State<CommentSheetWidget> createState() => _CommentSheetWidgetState();
// // }
// //
// // class _CommentSheetWidgetState extends State<CommentSheetWidget> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: const BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.only(
// //           topLeft: Radius.circular(16),
// //           topRight: Radius.circular(16),
// //         ),
// //       ),
// //       width: MediaQuery.of(context).size.width,
// //       child: CommentItem(tiktokModel: widget.tiktokModel),
// //     );
// //   }
// // }
// import 'package:big_assignment/data/models/comment_model.dart';
// import 'package:flutter/material.dart';
//
// import '../../../common_widgets/comment_bottom_bar.dart';
// import '../../../common_widgets/comment_item.dart';
// import '../../../data/models/like_comment_status.dart';
//
// class CommentSheetWidget extends StatefulWidget {
//   const CommentSheetWidget({super.key, required this.commentModel});
//   final List<CommentModel> commentModel;
//
//   @override
//   State<CommentSheetWidget> createState() => _CommentSheetWidgetState();
// }
//
// class _CommentSheetWidgetState extends State<CommentSheetWidget> {
//   final TextEditingController _commentController = TextEditingController();
//
//   void _sendComment() {
//     // Handle sending comment logic here
//     print('Comment: ${_commentController.text}');
//     _commentController.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Expanded(
//           child: CommentItem(
//             commentModel: widget.commentModel,
//             onLikeCommentStatusChanged: (LikeCommentStatus value) {},
//           ),
//         ),
//         CommentBottomBar(
//           commentController: _commentController,
//           onSend: _sendComment,
//         ),
//       ],
//     );
//   }
// }
import 'package:big_assignment/data/models/comment_model.dart';
import 'package:big_assignment/data/models/firebase/fb_comment_model.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/comment_bottom_bar.dart';
import '../../../common_widgets/comment_item.dart';
import '../../../data/models/like_comment_status.dart';
import '../../../data/remote/firestores_service.dart';

class CommentSheetWidget extends StatefulWidget {
  const CommentSheetWidget({super.key});

  @override
  State<CommentSheetWidget> createState() => _CommentSheetWidgetState();
}

class _CommentSheetWidgetState extends State<CommentSheetWidget> {
  late String? nameUserComment;
  late String content;
  late String? urlAvatar;
  final TextEditingController _commentController = TextEditingController();
  final _firestoreService = FirestoreService();
  void _sendComment() async {
    final newComment = CommentModel(
      id: '1',
      nameUserComment: nameUserComment ?? '',
      content: content,
      urlAvatar: urlAvatar ?? '',
      numberLikeComment: 0,
      numberReplyComment: 0,
      likeCommentStatus: LikeCommentStatus.unlike,
      timeComment: DateTime.now(),
    );
    await _firestoreService.addComment(
      '9tvXYflrBWlqkIlxe2xM',
      newComment.toFbCommentModel(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestoreService.getComments('9tvXYflrBWlqkIlxe2xM'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}',
                style: const TextStyle(
                  color: Colors.red,
                )),
          );
        }
        final comments = snapshot.data
            ?.map((fbCommentModel) => fbCommentModel.toCommentModel())
            .toList();
        if (comments == null) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final commentLists = comments[index];
                  return CommentItem(
                    commentModel: commentLists,
                    onLikeCommentStatusChanged: (LikeCommentStatus value) {
                      //widget.comments[index].LikeComment = value;
                    },
                  );
                },
              ),
            ),
            CommentBottomBar(
              commentController: _commentController,
              onSend: _sendComment,
            ),
          ],
        );
      },
    );
  }
}
