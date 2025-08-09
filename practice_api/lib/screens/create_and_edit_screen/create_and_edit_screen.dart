import 'package:flutter/material.dart';
import 'package:practice_api/screens/create_and_edit_screen/widgets/build_detail_body_widget.dart';
import 'package:practice_api/screens/list_friend_screen/models/friend_model.dart';
import 'package:practice_api/screens/list_friend_screen/widgets/friend_controller.dart';
import 'package:provider/provider.dart';

class CreateAndEditScreen extends StatelessWidget
{
    const CreateAndEditScreen({super.key, this.friendModel});
    static const routeName = '/create-and-edit';
    final FriendModel? friendModel;
    @override
    Widget build(BuildContext context)
    {
        return ChangeNotifierProvider(
            create: (_) => FriendController(),
            child: const CreateAndEditScreenBody(),
        );
    }
}

class CreateAndEditScreenBody extends StatelessWidget
{
    const CreateAndEditScreenBody({super.key, this.friendModel});
    final FriendModel? friendModel;
    @override
    Widget build(BuildContext context)
    {

        return Scaffold(
            backgroundColor: Color(0xFF212121),
            appBar: AppBar(
                title: const Text('Create and Edit',
                style:
                    TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                    )
                  ,),
                centerTitle: true,
                backgroundColor: Color(0xFF212121),
            ),
            body:
           BuildDetailBodyWidget(friendModel: friendModel)
        );
    }
}
