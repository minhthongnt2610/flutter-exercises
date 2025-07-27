import '../follow_status.dart';
import '../heart_status.dart';
import '../save_status.dart';
import '../tiktok_model.dart';

class FbTiktokModel {
  FbTiktokModel({
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
  final int heartStatus;
  final int saveStatus;
  final int followStatus;

  FbTiktokModel copyWith({
    String? id,
    String? urlVideo,
    String? urlAvatar,
    String? urlMusic,
    int? numberLike,
    int? numberComment,
    int? numberShare,
    int? numberSave,
    String? name,
    String? description,
    String? nameMusic,
    int? heartStatus,
    int? saveStatus,
    int? followStatus,
  }) {
    return FbTiktokModel(
      id: id ?? this.id,
      urlVideo: urlVideo ?? this.urlVideo,
      urlAvatar: urlAvatar ?? this.urlAvatar,
      numberLike: numberLike ?? this.numberLike,
      numberComment: numberComment ?? this.numberComment,
      numberShare: numberShare ?? this.numberShare,
      numberSave: numberSave ?? this.numberSave,
      name: name ?? this.name,
      description: description ?? this.description,
      nameMusic: nameMusic ?? this.nameMusic,
      heartStatus: heartStatus ?? this.heartStatus,
      saveStatus: saveStatus ?? this.saveStatus,
      followStatus: followStatus ?? this.followStatus,
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

  factory FbTiktokModel.fromJson(Map<String, dynamic> json) {
    return FbTiktokModel(
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
}

extension FbTiktokModelExtension on FbTiktokModel {
  TiktokModel toTiktokModel() {
    return TiktokModel(
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
      heartStatus: HeartStatus.values[heartStatus],
      saveStatus: SaveStatus.values[saveStatus],
      followStatus: FollowStatus.values[followStatus],
    );
  }
}
