import 'package:practice_firebase/models/friend_model.dart';

class FbFriendModel {
  String? id;
  String name;
  int birthdate;
  String email;

  FbFriendModel({
    this.id,
    required this.name,
    required this.birthdate,
    required this.email,
  });

  factory FbFriendModel.fromJson(Map<String, dynamic> json, String id) => FbFriendModel(
    id: id,
    name: json["name"],
    birthdate: json["birthdate"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "birthdate": birthdate,
    "email": email,
  };
}

extension FbFriendModelExtension on FbFriendModel {
  FriendModel toFriendModel() {
    return FriendModel(
      id: id,
      name: name,
      birthday: DateTime.fromMillisecondsSinceEpoch(birthdate),
      email: email,
    );
  }
}
