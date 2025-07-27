import 'package:big_assignment/data/models/comment_model.dart';
import 'package:big_assignment/data/models/like_comment_status.dart';

class FbCommentModel {
  final String id;
  final String nameUserComment;
  final String content;
  final String urlAvatar;
  final int numberLikeComment;
  final int numberReplyComment;
  final int likeCommentStatus;
  final int timeComment;
  FbCommentModel({
    required this.id,
    required this.nameUserComment,
    required this.content,
    required this.urlAvatar,
    required this.numberLikeComment,
    required this.numberReplyComment,
    required this.likeCommentStatus,
    required this.timeComment,
  });

  FbCommentModel copyWith({
    String? id,
    String? nameUserComment,
    String? content,
    String? urlAvatar,
    int? numberLikeComment,
    int? numberReplyComment,
    int? likeCommentStatus,
    int? timeComment,
  }) {
    return FbCommentModel(
      id: id ?? this.id,
      nameUserComment: nameUserComment ?? this.nameUserComment,
      content: content ?? this.content,
      urlAvatar: urlAvatar ?? this.urlAvatar,
      numberLikeComment: numberLikeComment ?? this.numberLikeComment,
      numberReplyComment: numberReplyComment ?? this.numberReplyComment,
      likeCommentStatus: likeCommentStatus ?? this.likeCommentStatus,
      timeComment: timeComment ?? this.timeComment,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nameUserComment': nameUserComment,
      'content': content,
      'urlAvatar': urlAvatar,
      'numberLikeComment': numberLikeComment,
      'numberReplyComment': numberReplyComment,
      'likeCommentStatus': likeCommentStatus,
      'timeComment': timeComment,
    };
  }

  factory FbCommentModel.fromJson(Map<String, dynamic> json) {
    return FbCommentModel(
      id: json['id'],
      nameUserComment: json['nameUserComment'],
      content: json['content'],
      urlAvatar: json['urlAvatar'],
      numberLikeComment: json['numberLikeComment'],
      numberReplyComment: json['numberReplyComment'],
      likeCommentStatus: json['likeCommentStatus'],
      timeComment: json['timeComment'],
    );
  }
}

extension FbCommentModelExtension on FbCommentModel {
  CommentModel toCommentModel() {
    return CommentModel(
      id: id,
      nameUserComment: nameUserComment,
      content: content,
      urlAvatar: urlAvatar,
      numberLikeComment: numberLikeComment,
      numberReplyComment: numberReplyComment,
      likeCommentStatus: LikeCommentStatus.values[likeCommentStatus],
      timeComment: DateTime.fromMillisecondsSinceEpoch(timeComment),
    );
  }
}
