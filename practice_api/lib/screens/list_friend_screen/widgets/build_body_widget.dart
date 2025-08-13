import 'package:flutter/material.dart';
import 'package:practice_api/screens/list_friend_screen/widgets/friend_controller.dart';
import 'package:practice_api/screens/list_friend_screen/widgets/friend_element.dart';
import 'package:provider/provider.dart';

import '../../create_and_edit_screen/create_and_edit_screen.dart';

class BuildBodyWidget extends StatelessWidget
{
    const BuildBodyWidget({
        super.key,
    });

    @override
    Widget build(BuildContext context)
    {
        final controller = Provider.of<FriendController>(context, listen: true);

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
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text('No data'),
                        ElevatedButton(
                            onPressed: () async
                            {
                                await controller.getListFriend();
                            },
                            child: const Text('Reload'),
                        ),
                    ],
                ),
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
                        onTap: ()
                        async {
                          final result = await  Navigator.pushNamed(
                                context,
                                CreateAndEditScreen.routeName,
                                arguments: friend,
                            );
                          if (result == true)
                          {
                            await controller.getListFriend();
                          }
                        },
                        onStatusChange: (value)
                        {

                        },
                    );
                }
            );
        }

    }
}
