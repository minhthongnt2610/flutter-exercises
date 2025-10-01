import 'package:intl/intl.dart';

import 'firebase/fb_friend_model.dart';

class FriendModel {
  int? id;
  String name;
  DateTime birthdate;
  String email;
  String nameUser;

  FriendModel({
    this.id,
    required this.name,
    required this.birthdate,
    required this.email,
    required this.nameUser,
  });

  factory FriendModel.fromJson(Map<String, dynamic> json) => FriendModel(
    id: json["id"],
    name: json["name"],
    birthdate: DateTime.parse(json["birthdate"]),
    email: json["email"],
    nameUser: json["nameUser"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "birthdate":
        "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
    "email": email,
    "nameUser": nameUser,
  };
}

extension FriendModelExtension on FriendModel {
  String get displayDate {
    final dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(birthdate);
  }

  FbFriendModel toFbFriendModel() {
    return FbFriendModel(
      id: id,
      name: name,
      birthdate: birthdate.millisecondsSinceEpoch,
      email: email,
      nameUser: nameUser,
    );
  }
}
