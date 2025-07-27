import 'package:big_assignment/constants/app_icons.dart';

enum LikeCommentStatus {
  likeComment,
  unlike,
}

extension LikeCommentStatusExtension on LikeCommentStatus {
  String get icon {
    switch (this) {
      case LikeCommentStatus.likeComment:
        return AppIcons.likeComment;
      case LikeCommentStatus.unlike:
        return AppIcons.unLikeComment;
    }
  }
}
