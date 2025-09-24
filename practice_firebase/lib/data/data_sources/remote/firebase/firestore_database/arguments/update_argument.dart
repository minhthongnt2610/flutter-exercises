class UpdateArgument {
  String name;
  DateTime birthday;
  String email;

  UpdateArgument({
    required this.name,
    required this.birthday,
    required this.email,
  });

  Map<String, dynamic> toJson() =>{
    "name": name,
    "birthday": birthday,
    "email": email,
  };
}
