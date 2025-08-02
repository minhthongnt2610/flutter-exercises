import 'package:flutter/material.dart';

import '../../services/list_friend_service.dart';
import '../models/friend_model.dart';
import '../models/requests/create_friend_request.dart';
import 'package:flutter/cupertino.dart';
import '../models/requests/update_friend_request.dart';
class FriendController extends ChangeNotifier
{
    final _listFriendService = ListFriendServiceImpl();
    List<FriendModel>? _friends;
    String? error;
    bool isLoading = false;

    Future<void> getListFriend() async
    {
        try
        {
            isLoading = true;
            final friends = await _listFriendService.getListFriend();
            _friends = friends;
            error = null;
            for (final friend in friends)
            {
                debugPrint(friend.toJson().toString());
            }
            notifyListeners();
        }
        catch(e)
        {
            error = e.toString();
            notifyListeners();
        }
        finally
        {
            isLoading = false;
            notifyListeners();
        }
    }

    Future<void> getFriendById(int id) async
    {
        try
        {
            isLoading = true;
            final friend = await _listFriendService.getFriendById(id);
            _friends = [friend];
            error = null;
            debugPrint(friend.toJson().toString());
            notifyListeners();
        }
        catch(e)
        {
            error = e.toString();
            notifyListeners();
        }
        finally
        {
            isLoading = false;
            notifyListeners();
        }
    }

    Future<void> addFriend({
        required String name,
        required DateTime birthdate,
    }) async
    {
        try
        {
            isLoading = true;
            final request = CreateFriendRequest(name: name, birthdate: birthdate);
            final friend = await _listFriendService.addFriend(request);
            error = null;
            debugPrint(friend.toJson().toString());
            notifyListeners();
        }
        catch(e)
        {
            error = e.toString();
            notifyListeners();
        }
        finally
        {
            isLoading = false;
            notifyListeners();
        }
    }

    Future<void> deleteFriend({
        required int id,
    }) async
    {
        try
        {
            isLoading = true;
            final friend = await _listFriendService.deleteFriend(id);
            error = null;
            debugPrint(friend.toJson().toString());
            notifyListeners();
        }
        catch(e)
        {
            error = e.toString();
            notifyListeners();
        }
        finally
        {
            isLoading = false;
            notifyListeners();
        }
    }

    Future<void> updateFriend({
        required int id,
        required String name,
        required DateTime birthdate,
    }) 
    async
    {
        try
        {
            isLoading = true;
            final request = UpdateFriendRequest(id: id, name: name, birthdate: birthdate,);
            final friend = await _listFriendService.updateFriend(request);
            error = null;
            debugPrint(friend.toJson().toString());
            notifyListeners();
        }
        catch(e)
        {
            error = e.toString();
            notifyListeners();
        }
        finally
        {
            isLoading = false;
            notifyListeners();
        }
    }
}
