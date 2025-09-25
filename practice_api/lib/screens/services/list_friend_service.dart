import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:practice_api/screens/list_friend_screen/models/friend_model.dart';

import '../list_friend_screen/models/requests/create_friend_request.dart';

import 'package:http/http.dart' as http;

import '../list_friend_screen/models/requests/update_friend_request.dart';

abstract class ListFriendService
{
    Future<List<FriendModel>> getListFriend();
    Future<FriendModel> getFriendById(int id);
    Future<FriendModel> addFriend(CreateFriendRequest request);
    Future<FriendModel> updateFriend(UpdateFriendRequest request);
    Future<FriendModel> deleteFriend(int id);
}

class ListFriendServiceImpl implements ListFriendService
{
    final baseUrl = "http://192.168.1.15:3000/api/users";

    @override
    Future<List<FriendModel>> getListFriend() async
    {
        final url = Uri.parse(baseUrl);

        final response = await http.get(url);

        if (response.statusCode != 200)
        {
            throw Exception("Failed to load data");
        }

        final List<dynamic> jsonList = jsonDecode(response.body);
        final data = jsonList.map((json) => FriendModel.fromJson(json)).toList();
        return data;
    }

    @override
    Future<FriendModel> getFriendById(int id)
    async
    {
        final url = Uri.parse('$baseUrl/$id');
        final response = await http.get(url);

        if (response.statusCode != 200)
        {
            throw Exception("Failed to load data");
        }
        else
        {
            final data = FriendModel.fromJson(jsonDecode(response.body));
            return data;
        }
    }

    @override
    Future<FriendModel> addFriend(CreateFriendRequest request)
    async
    {
        final url = Uri.parse(baseUrl);

        final response = await http.post(
            url, 
            body: jsonEncode(request.toJson()),
            headers:
            {
                'Content-Type': 'application/json',
            },
        );
        debugPrint(response.body);
        if (response.statusCode != 201)
        {
            throw Exception("Failed to load data");
        }
        final data = FriendModel.fromJson(jsonDecode(response.body));
        return data;
    }

    @override
    Future<FriendModel> deleteFriend(int id)
    async
    {
        final url = Uri.parse('$baseUrl/$id');
        final response = await http.delete(url);

        if (response.statusCode != 200)
        {
            throw Exception("Failed to load data");
        }

        final data = FriendModel.fromJson(jsonDecode(response.body));
        debugPrint("delete success");
        return data;

    }

    @override
    Future<FriendModel> updateFriend(UpdateFriendRequest request)
    async
    {
        final url = Uri.parse('$baseUrl/${request.id}');
        final response = await http.put( 
            url,
            body: jsonEncode(request.toJson()),
            headers:
            {
                'Content-Type': 'application/json',
            },
        );
        if (response.statusCode != 200)
        {
            throw Exception("Failed to load data");
        }
        final data = FriendModel.fromJson(jsonDecode(response.body));
        return data;

    }

}
