import 'package:practice_firebase/models/friend_model.dart';

class FbFriendModel {
  int? id;
  String name;
  int birthdate;
  String email;
  String? nameUser;

  FbFriendModel({
    this.id,
    required this.name,
    required this.birthdate,
    required this.email,
     this.nameUser,
  });

  factory FbFriendModel.fromJson(Map<String, dynamic> json) => FbFriendModel(
    id: json["id"],
    name: json["name"],
    birthdate: json["birthdate"],
    email: json["email"],
    nameUser: json["nameUser"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "birthdate": birthdate,
    "email": email,
    "nameUser": nameUser,
  };
}

extension FbFriendModelExtension on FbFriendModel {
  FriendModel toFriendModel() {
    return FriendModel(
      id: id,
      name: name,
      birthdate: DateTime.fromMillisecondsSinceEpoch(birthdate),
      email: email,
      nameUser: nameUser,
    );
  }
}
