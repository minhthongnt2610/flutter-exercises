import 'dart:io';
import '../user_model.dart';

class FbUserModel {
  final String id;
  final String nameUser;
  final String? photoUrl;
  final File? photoFile;

  FbUserModel({
    required this.id,
    required this.nameUser,
    this.photoUrl,
    this.photoFile,
  });

  factory FbUserModel.fromJson(Map<String, dynamic> json, String id) {
    return FbUserModel(
      id: id,
      nameUser: json["nameUser"],
      photoUrl: json["photoUrl"],
      photoFile: json['photoUrl'] != null && File(json['photoUrl']).existsSync()
          ? File(json['photoUrl'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameUser": nameUser,
    "photoUrl": photoUrl,
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
