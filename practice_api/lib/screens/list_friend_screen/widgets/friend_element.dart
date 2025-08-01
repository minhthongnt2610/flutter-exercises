import 'package:flutter/material.dart';
import 'package:practice_api/screens/list_friend_screen/widgets/info_friend_widgets.dart';

class FriendElement extends StatefulWidget
{
    const FriendElement({super.key});

    @override
    State<FriendElement> createState() => _FriendElementState();
}

class _FriendElementState extends State<FriendElement>
{
    @override
    Widget build(BuildContext context)
    {
        final height = MediaQuery.sizeOf(context).height;
        final width = MediaQuery.sizeOf(context).width;
        return GestureDetector(
            onTap: ()
            {
            },
            child: Container(
                width: 850 * width / 868,
                height: 100 * height / 868,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white54
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        children: [
                            Row(
                                children: [
                                    InfoFriendWidgets(title: 'Full name'),
                                    SizedBox(width: 15, 
                                        child: Text(' :', 
                                            style: 
                                            TextStyle(
                                                color: Colors.black,
                                            ),
                                        ),
                                    ),
                                    InfoFriendWidgets(title: 'Thong NT'),
                                ],
                            ),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    InfoFriendWidgets(title: 'Birthday'),
                                    SizedBox(width: 15,
                                        child: Text(' :',
                                            style:
                                            TextStyle(
                                                color: Colors.black,
                                            ),
                                        ),
                                    ),
                                    InfoFriendWidgets(title: '26-10-2004'),
                                ],
                            ),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    InfoFriendWidgets(title: 'Age'),
                                    SizedBox(width: 15,
                                        child: Text(' :',
                                            style:
                                            TextStyle(
                                                color: Colors.black,
                                            ),
                                        ),
                                    ),
                                    InfoFriendWidgets(title: '20'),
                                ],
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}
