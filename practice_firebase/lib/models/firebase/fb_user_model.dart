class FbUserModel {
  final String id;
  final String nameUser;
  final String photoUrl;

  FbUserModel({required this.id, required this.nameUser, required this.photoUrl});

  factory FbUserModel.fromJson(Map<String, dynamic> json) => FbUserModel(
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

