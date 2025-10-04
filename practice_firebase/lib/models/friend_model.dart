import 'package:intl/intl.dart';

import 'firebase/fb_friend_model.dart';

class FriendModel {
  int? id;
  String name;
  DateTime birthday;
  String email;

  FriendModel({
    this.id,
    required this.name,
    required this.birthday,
    required this.email,
  });

  factory FriendModel.fromJson(Map<String, dynamic> json) => FriendModel(
    id: json["id"],
    name: json["name"],
    birthday: DateTime.parse(json["birthdate"]),
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "birthdate":
        "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
    "email": email,
  };
}

extension FriendModelExtension on FriendModel {
  String get displayDate {
    final dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(birthday);
  }

  FbFriendModel toFbFriendModel() {
    return FbFriendModel(
      id: id,
      name: name,
      birthdate: birthday.millisecondsSinceEpoch,
      email: email,
    );
  }
}
