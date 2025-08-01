class CreateFriendRequest
{
    String name;
    DateTime birthdate;

    CreateFriendRequest({
        required this.name,
        required this.birthdate,
    });

    Map<String, dynamic> toJson() =>
    {
        "name": name,
        "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
    };
}
