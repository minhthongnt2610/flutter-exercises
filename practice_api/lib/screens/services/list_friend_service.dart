import 'package:practice_api/screens/list_friend_screen/models/friend_model.dart';

import '../list_friend_screen/models/requests/create_friend_request.dart';

import 'package:http/http.dart' as http;

abstract class ListFriendService{
  Future<List<FriendModel>> getListFriend();
  Future<void> getFriendById(int id);
  Future<void> addFriend(CreateFriendRequest request);
  Future<void> updateFriend(FriendModel friend);
  Future<void> deleteFriend(int id);
}

class ListFriendServiceImpl implements ListFriendService{
  final baseUrl = "http://localhost:3000/api/users";
  @override
  Future<void> addFriend(CreateFriendRequest request) {
    // TODO: implement addFriend
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFriend(int id) {
    // TODO: implement deleteFriend
    throw UnimplementedError();
  }

  @override
  Future<List<FriendModel>> getListFriend() {
    // TODO: implement getListFriend
    throw UnimplementedError();
  }

  @override
  Future<void> updateFriend(FriendModel friend) {
    // TODO: implement updateFriend
    throw UnimplementedError();
  }

  @override
  Future<void> getFriendById(int id) {
    // TODO: implement getFriendById
    throw UnimplementedError();
  }
  
}