import 'package:flutter/material.dart';
import 'package:practice_api/screens/list_friend_screen/models/requests/create_friend_request.dart';
import 'package:practice_api/screens/list_friend_screen/widgets/friend_element.dart';

import '../services/list_friend_service.dart';

class ListFriendScreen extends StatefulWidget
{
    const ListFriendScreen({super.key});
    static const routeName = '/list-friend';
    @override
    State<ListFriendScreen> createState() => _ListFriendScreenState();
}

class _ListFriendScreenState extends State<ListFriendScreen>
{
    final _listFriendService = ListFriendServiceImpl();
    @override
    void initState() 
    {
        super.initState();
         //_getListFriend();
        // _getFriendById(3);
        // _addFriend();
        _deleteFriend(16);
    }
    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(
                title: const Text('List Friend'),
                centerTitle: true,
            ),
            body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: const FriendElement(),

            ),
          floatingActionButton: FloatingActionButton(
            onPressed: ()
            {

            },
            child: const Icon(Icons.add),
          ),
        );
    }

    Future<void> _getListFriend() async
    {
        final friends = await _listFriendService.getListFriend();

        for (final friend in friends)
        {
            debugPrint(friend.toJson().toString());
        }
    }

    Future<void> _getFriendById(int id) async
    {
        final friend = await _listFriendService.getFriendById(id);
        debugPrint(friend.toJson().toString());
    }

    Future<void> _addFriend() async
    {
      final request = CreateFriendRequest(name: "Tran", birthdate: DateTime.parse("2004-05-22") );
      final friend = await _listFriendService.addFriend(request);
      debugPrint(friend.toJson().toString());
    }

    Future<void> _deleteFriend(int id) async {
      final friend = await _listFriendService.deleteFriend(id);
      debugPrint(friend.toJson().toString());
    }

}
