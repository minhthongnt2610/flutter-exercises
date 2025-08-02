import 'package:flutter/material.dart';
import 'package:practice_api/screens/list_friend_screen/widgets/friend_controller.dart';
import 'package:provider/provider.dart';

class ListFriendScreen extends StatelessWidget
{
    const ListFriendScreen({super.key});

    @override
    Widget build(BuildContext context) 
    {
        return ChangeNotifierProvider(
            create: (context) => FriendController()..getListFriend(),
            child: ListFriendScreenBody(), 
        );
    }
}

class ListFriendScreenBody extends StatelessWidget
{
    const ListFriendScreenBody({super.key});
    @override
    Widget build(BuildContext context)
    {
        final controller = context.watch<FriendController>(); //cần thiết dòng này
        
        return Scaffold(
            appBar: AppBar(
                title: const Text('List Friend'),
                centerTitle: true,
            ),
            body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Placeholder(),

            ),
            floatingActionButton: FloatingActionButton(
                onPressed: ()
                {

                },
                child: const Icon(Icons.add),
            ),
        );
    }
}
