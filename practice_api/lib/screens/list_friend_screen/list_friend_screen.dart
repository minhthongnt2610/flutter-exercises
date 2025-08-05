import 'package:flutter/material.dart';
import 'package:practice_api/screens/create_and_edit_screen/create_and_edit_screen.dart';
import 'package:practice_api/screens/list_friend_screen/widgets/build_body_widget.dart';
import 'package:practice_api/screens/list_friend_screen/widgets/friend_controller.dart';
import 'package:provider/provider.dart';


class ListFriendScreen extends StatelessWidget
{
    const ListFriendScreen({super.key});
    static const routeName = '/list-friend';

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
        final controller = Provider.of<FriendController>(context, listen: true); // Sử dụng listen: false nếu chỉ gọi phương thức

        return Scaffold(
            appBar: AppBar(
                title: const Text('List Friend'),
                centerTitle: true,
            ),
            body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                    children: [
                        BuildBodyWidget(),
                        if (controller.isLoading) _buildLoadingWidget(),
                    ]
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: ()
                {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateAndEditScreen()));
                },
                child: const Icon(Icons.add),
            ),
        );
    }
}


Widget _buildLoadingWidget(){
    return const Center(
        child: CircularProgressIndicator(),
    );
}


