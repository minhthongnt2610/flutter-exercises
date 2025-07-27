import 'package:big_assignment/data/models/like_comment_status.dart';

import 'firebase/fb_comment_model.dart';

class CommentModel {
  final String id;
  final String nameUserComment;
  final String content;
  final String urlAvatar;

  final int numberLikeComment;
  final int numberReplyComment;
  final LikeCommentStatus likeCommentStatus;
  final DateTime timeComment;

  CommentModel({
    required this.id,
    required this.nameUserComment,
    required this.content,
    required this.urlAvatar,
    required this.numberLikeComment,
    required this.numberReplyComment,
    required this.likeCommentStatus,
    required this.timeComment,
  });

  CommentModel copyWith({
    String? id,
    String? nameUserComment,
    String? content,
    String? urlAvatar,
    int? numberLikeComment,
    int? numberReplyComment,
    LikeCommentStatus? likeComment,
    DateTime? timeComment,
  }) {
    return CommentModel(
      id: id ?? this.id,
      nameUserComment: nameUserComment ?? this.nameUserComment,
      content: content ?? this.content,
      urlAvatar: urlAvatar ?? this.urlAvatar,
      numberLikeComment: numberLikeComment ?? this.numberLikeComment,
      numberReplyComment: numberReplyComment ?? this.numberReplyComment,
      likeCommentStatus: likeComment ?? this.likeCommentStatus,
      timeComment: timeComment ?? this.timeComment,
    );
  }

  //fromJson
  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      nameUserComment: json['nameUserComment'],
      content: json['content'],
      urlAvatar: json['urlAvatar'],
      numberLikeComment: json['numberLikeComment'],
      numberReplyComment: json['numberReplyComment'],
      likeCommentStatus: json['likeCommentStatus'],
      timeComment: DateTime.parse(json['timeComment']),
    );
  }
  //toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nameUserComment': nameUserComment,
      'content': content,
      'urlAvatar': urlAvatar,
      'numberLikeComment': numberLikeComment,
      'numberReplyComment': numberReplyComment,
      'likeCommentStatus': likeCommentStatus,
      'timeComment': timeComment.toIso8601String(),
    };
  }
}

extension CommentModelExtension on CommentModel {
  FbCommentModel toFbCommentModel() {
    return FbCommentModel(
      id: id,
      nameUserComment: nameUserComment,
      content: content,
      urlAvatar: urlAvatar,
      numberLikeComment: numberLikeComment,
      numberReplyComment: numberReplyComment,
      likeCommentStatus: likeCommentStatus.index,
      timeComment: timeComment.millisecondsSinceEpoch,
    );
  }
}
