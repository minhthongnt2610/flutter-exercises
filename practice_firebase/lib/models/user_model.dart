class UserModel {
  final String id;
  final String nameUser;
  final String photoUrl;

  UserModel({required this.id, required this.nameUser, required this.photoUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    nameUser: json["nameUser"],
    photoUrl: json["photoUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameUser": nameUser,
    "photoUrl": photoUrl,
  };


}

