import 'dart:io';
import '../user_model.dart';

class FbUserModel {
  final String id;
  final String nameUser;
  final String? photoUrl;     // URL online (lưu trong Firestore)
  final File? photoFile;      // File local (không lưu trong Firestore)

  FbUserModel({
    required this.id,
    required this.nameUser,
    this.photoUrl,
    this.photoFile,
  });

  factory FbUserModel.fromJson(Map<String, dynamic> json, String id) {
    return FbUserModel(
      id: id,
      nameUser: json["nameUser"] ?? "Unknown User",
      photoUrl: json["photoUrl"] ?? '',
      // Không tạo File() từ URL vì đó là link mạng
      photoFile: null,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameUser": nameUser,
    "photoUrl": photoUrl ?? '',
    // Không lưu File vào Firestore
  };
}

extension FbUserModelExtension on FbUserModel {
  UserModel toUserModel() {
    return UserModel(
      id: id,
      nameUser: nameUser,
      photoUrl: photoUrl ?? '',
      photoFile: photoFile!,
    );
  }
}
