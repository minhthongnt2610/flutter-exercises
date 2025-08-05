import 'package:flutter/material.dart';
import 'package:practice_api/screens/list_friend_screen/widgets/friend_controller.dart';
import 'package:practice_api/screens/list_friend_screen/widgets/friend_element.dart';

class BuildBodyWidget extends StatelessWidget
{
    const BuildBodyWidget({
        super.key,

        required this.controller
    });
    final FriendController controller;
    @override
    Widget build(BuildContext context)
    {
        if (controller.error != null && controller.error!.isNotEmpty)
        {
            return Center(
                child: Text(
                    controller.error.toString(),
                    style: TextStyle(
                        color: Colors.red
                        , )
                    ,)
            );
        }
        else if (controller.friends == null || (controller.friends!.isEmpty && controller.isLoading))
        {
            return Container();
        }
        else if (controller.friends!.isEmpty) 
        {
            return const Center(
                child: Text('No Data'),
            );
        }
        else 
        {
            return ListView.builder(
                itemCount: controller.friends!.length,

                itemBuilder: (context, index)
                {
                   final friend = controller.friends![index];
                   return FriendElement(
                       friend: friend,
                       onTap: (){},
                       onStatusChange: (value){},
                   );
                }
            );
        }

    }
}
