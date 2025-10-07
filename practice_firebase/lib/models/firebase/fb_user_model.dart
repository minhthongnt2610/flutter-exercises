import 'dart:io';

import '../user_model.dart';

class FbUserModel {
  final String id;
  final String nameUser;
  final String photoUrl;
  final File photoFile;

  FbUserModel({
    required this.id,
    required this.nameUser,
    required this.photoUrl,
    required this.photoFile,
  });

  factory FbUserModel.fromJson(Map<String, dynamic> json, String id) =>
      FbUserModel(
        id: id,
        nameUser: json["nameUser"],
        photoUrl: json["photoUrl"],
        photoFile: File(json["photoUrl"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameUser": nameUser,
    "photoUrl": photoUrl,
    "photoFile": photoFile,
  };
}

extension FbUserModelExtension on FbUserModel {
  UserModel toUserModel() {
    return UserModel(
      id: id,
      nameUser: nameUser,
      photoUrl: photoUrl,
      photoFile: photoFile,
    );
  }
}
