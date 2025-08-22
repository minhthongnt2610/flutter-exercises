import 'package:flutter/material.dart';
import 'package:sqlite_flutter_project/data/data_sources/local/db/db_client.dart';
import 'package:sqlite_flutter_project/data/models/db/db_friend_model.dart';
import 'package:sqlite_flutter_project/data/models/friend_model.dart';

class DbController extends ChangeNotifier {
  String? editName;
  String? editPhone;
  String? editEmail;

  //state danh sach ban be
  List<DbFriendModel> _friendList = [];

  List<DbFriendModel> get friendList => _friendList;

  void initState([FriendModel? friendModel]) {
    if (friendModel != null) {
      editName = friendModel.name;
      editPhone = friendModel.phone;
      editEmail = friendModel.email;
    } else {
      editName = null;
      editPhone = null;
      editEmail = null;
    }
  }

  void updateName(String name) {
    editName = name;
    notifyListeners();
  }

  void updatePhone(String phone) {
    editPhone = phone;
    notifyListeners();
  }

  void updateEmail(String email) {
    editEmail = email;
    notifyListeners();
  }

  Future<void> fetchFriend() async {
    final friendList = await DbClient().getAllFriends();
    _friendList = friendList;
    notifyListeners();
  }

  Future<void> insertFriend({
    required String name,
    required String phone,
    required String email,
  }) async {
    final friendModel = FriendModel(name: name, phone: phone, email: email);
    DbFriendModel dbFriendModel;
    dbFriendModel = friendModel.toDbFriendModel();
    await DbClient().insert(dbFriendmodel: dbFriendModel);
    await fetchFriend();
  }

  Future<void> updateFriend({
    required String name,
    required String phone,
    required String email,
  }) async {
    final friendModel = FriendModel(name: name, phone: phone, email: email);
    DbFriendModel dbFriendModel;
    dbFriendModel = friendModel.toDbFriendModel();
    await DbClient().update(dbFriendmodel: dbFriendModel);
    await fetchFriend();
  }

  Future<void> deleteFriend({required int id}) async {
    await DbClient().delete(id: id);
    await fetchFriend();
  }
}
