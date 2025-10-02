import 'package:flutter/cupertino.dart';
import 'package:sqlite_flutter_project/data/models/db/db_friend_model.dart';

class FriendModel {
  const FriendModel({
    @required this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  final int? id;
  final String name;
  final String phone;
  final String email;

  FriendModel copyWith({int? id, String? name, String? phone, String? email}) {
    return FriendModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'phone': phone, 'email': email};
  }

  @override
  String toString() {
    return 'FriendModel(id: $id, name: $name, phone: $phone, email: $email)';
  }
}

extension FriendModelExtension on FriendModel {
  DbFriendModel toDbFriendModel() {
    return DbFriendModel(id: id, name: name, phone: phone, email: email);
  }
}
