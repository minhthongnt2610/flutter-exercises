
class FriendModel
{
  int id;
  String name;
  DateTime birthdate;
  int age;

  FriendModel({
    required this.id,
    required this.name,
    required this.birthdate,
    required this.age,
  });

  factory FriendModel.fromJson(Map<String, dynamic> json) => FriendModel(
    id: json["id"],
    name: json["name"],
    birthdate: DateTime.parse(json["birthdate"]),
    age: json["age"] ,
  );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
        "age": age,
      };
}
