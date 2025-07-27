import 'package:big_assignment/data/models/follow_status.dart';
import 'package:big_assignment/data/models/heart_status.dart';
import 'package:big_assignment/data/models/save_status.dart';

import 'firebase/fb_tiktok_model.dart';

class TiktokModel {
  TiktokModel({
    required this.id,
    required this.urlVideo,
    required this.urlAvatar,
    required this.numberLike,
    required this.numberComment,
    required this.numberShare,
    required this.numberSave,
    required this.name,
    required this.description,
    required this.nameMusic,
    required this.heartStatus,
    required this.saveStatus,
    required this.followStatus,
  });

  final String id;
  final String urlVideo;
  final String urlAvatar;
  final int numberLike;
  final int numberComment;
  final int numberShare;
  final int numberSave;
  final String name;
  final String description;
  final String nameMusic;
  final HeartStatus heartStatus;
  final SaveStatus saveStatus;
  final FollowStatus followStatus;

  TiktokModel copyWith({
    String? id,
    String? urlVideo,
    String? urlAvatar,
    int? numberLike,
    int? numberComment,
    int? numberShare,
    int? numberSave,
    String? name,
    String? description,
    String? nameMusic,
    HeartStatus? heartStatus,
    SaveStatus? saveStatus,
    FollowStatus? followStatus,
  }) {
    return TiktokModel(
      id: id ?? this.id,
      urlVideo: urlVideo ?? this.urlVideo,
      urlAvatar: urlAvatar ?? this.urlAvatar,
      numberLike: numberLike ?? this.numberLike,
      numberComment: numberComment ?? this.numberComment,
      numberShare: numberShare ?? this.numberShare,
      name: name ?? this.name,
      description: description ?? this.description,
      nameMusic: nameMusic ?? this.nameMusic,
      heartStatus: heartStatus ?? this.heartStatus,
      saveStatus: saveStatus ?? this.saveStatus,
      numberSave: numberSave ?? this.numberSave,
      followStatus: followStatus ?? this.followStatus,
    );
  }

  factory TiktokModel.fromJson(Map<String, dynamic> json) {
    return TiktokModel(
      id: json['id'],
      urlVideo: json['urlVideo'],
      urlAvatar: json['urlAvatar'],
      numberLike: json['numberLike'],
      numberComment: json['numberComment'],
      numberShare: json['numberShare'],
      numberSave: json['numberSave'],
      name: json['name'],
      description: json['description'],
      nameMusic: json['nameMusic'],
      heartStatus: json['heartStatus'],
      saveStatus: json['saveStatus'],
      followStatus: json['followStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'urlVideo': urlVideo,
      'urlAvatar': urlAvatar,
      'numberLike': numberLike,
      'numberComment': numberComment,
      'numberShare': numberShare,
      'numberSave': numberSave,
      'name': name,
      'description': description,
      'nameMusic': nameMusic,
      'heartStatus': heartStatus,
      'saveStatus': saveStatus,
      'followStatus': followStatus,
    };
  }
}

extension TiktokModelExtension on TiktokModel {
  FbTiktokModel toFbTiktokModel() {
    return FbTiktokModel(
      id: id,
      urlVideo: urlVideo,
      urlAvatar: urlAvatar,
      numberLike: numberLike,
      numberComment: numberComment,
      numberShare: numberShare,
      numberSave: numberSave,
      name: name,
      description: description,
      nameMusic: nameMusic,
      heartStatus: heartStatus.index,
      saveStatus: saveStatus.index,
      followStatus: followStatus.index,
    );
  }
}
