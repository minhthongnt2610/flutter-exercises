class UpdateFriendRequest
{
  int id;
  String name;
  DateTime birthdate;

  UpdateFriendRequest({
    required this.id,
    required this.name,
    required this.birthdate,
  });

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
      };
}
