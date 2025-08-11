import 'package:flutter/material.dart';

import '../../services/list_friend_service.dart';
import '../models/friend_model.dart';
import '../models/requests/create_friend_request.dart';
import 'package:flutter/cupertino.dart';
import '../models/requests/update_friend_request.dart';
class FriendController extends ChangeNotifier
{
    final _listFriendService = ListFriendServiceImpl();
    String? error;
    bool isLoading = false;
    List<FriendModel>? friends;

    String? editName;
    DateTime? editBirthdate;

    void initState([FriendModel? friend]){
        if(friend != null){
            //update
            editName = friend.name;
            editBirthdate = friend.birthdate;
        }
        else{
            //create
            editName = null;
            editBirthdate = DateTime.now();
        }
    }

    void updateName(String name){
        editName = name;
        notifyListeners();
    }
    void updateBirthdate(DateTime? birthdate){
        editBirthdate = birthdate;
        notifyListeners();
    }


    Future<void> getListFriend() async
    {
        try
        {
            isLoading = true;
            error = null;
            notifyListeners(); // Thông báo ngay từ đầu khi bắt đầu loading

            final friends = await _listFriendService.getListFriend();
            this.friends = friends;

            if (friends.isNotEmpty) 
            {
                for (final friend in friends)
                {
                    debugPrint(friend.toJson().toString());
                }
            }
        }
        catch (e)
        {
            error = e.toString();
        }
        finally
        {
            isLoading = false;
            notifyListeners(); // Chỉ thông báo khi đã xử lý xong toàn bộ logic
        }
    }

    Future<void> getFriendById(int id) async
    {
        try
        {
            isLoading = true;
            final friend = await _listFriendService.getFriendById(id);
            error = null;
            debugPrint(friend.toJson().toString());
        }
        catch(e)
        {
            error = e.toString();
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
            friends?.add(friend);
            await getListFriend();
            debugPrint(friend.toJson().toString());
        }
        catch(e)
        {
            error = e.toString();
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
            friends?.removeWhere((element) => element.id == id);
            await getListFriend();
            debugPrint(friend.toJson().toString());
        }
        catch(e)
        {
            error = e.toString();
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
            friends?.removeWhere((element) => element.id == id);
            friends?.add(friend);
            await getListFriend();

            debugPrint(friend.toJson().toString());
        }
        catch(e)
        {
            error = e.toString();
        }
        finally
        {
            isLoading = false;
            notifyListeners();
        }
    }
}
