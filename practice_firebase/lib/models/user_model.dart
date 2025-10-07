
import 'package:practice_firebase/models/firebase/fb_user_model.dart';

class UserModel {
  final String id;
  final String nameUser;
  final String photoUrl;

  UserModel({required this.id, required this.nameUser, required this.photoUrl});

  factory UserModel.fromJson(Map<String, dynamic> json,String id) => UserModel(
    id: id,
    nameUser: json["nameUser"],
    photoUrl: json["photoUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameUser": nameUser,
    "photoUrl": photoUrl,
  };
}

extension UserModelExtension on UserModel {
  FbUserModel toFbUserModel() {
    return FbUserModel(id: id, nameUser: nameUser, photoUrl: photoUrl);
  }
}
