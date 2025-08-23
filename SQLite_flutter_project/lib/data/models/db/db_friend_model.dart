import 'package:sqlite_flutter_project/data/data_sources/local/db/db.table.dart';
import 'package:sqlite_flutter_project/data/models/friend_model.dart';

class DbFriendModel {
  DbFriendModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  final int? id;
  final String name;
  final String phone;
  final String email;

  DbFriendModel copyWith({
    int? id,
    String? name,
    String? phone,
    String? email,
  }) {
    return DbFriendModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      DbFriendTableFields.id: id,
      DbFriendTableFields.name: name,
      DbFriendTableFields.phone: phone,
      DbFriendTableFields.email: email,
    };
  }

  factory DbFriendModel.fromJson(Map<String, dynamic> json) {
    return DbFriendModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
    );
  }

  @override
  String toString() {
    return 'DbFriendModel(id: $id, name: $name, phone: $phone, email: $email)';
  }
}

extension DbFriendModelExtension on DbFriendModel {
  FriendModel toFriendModel() {
    return FriendModel(id: id, name: name, phone: phone, email: email);
  }
}
