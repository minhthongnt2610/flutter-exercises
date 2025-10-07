import '../user_model.dart';

class FbUserModel {
  final String id;
  final String nameUser;
  final String photoUrl;

  FbUserModel({required this.id, required this.nameUser, required this.photoUrl});

  factory FbUserModel.fromJson(Map<String, dynamic> json,String id) => FbUserModel(
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

extension FbUserModelExtension on FbUserModel{
  UserModel toUserModel(){
    return UserModel(id: id, nameUser: nameUser, photoUrl: photoUrl);
  }
}

